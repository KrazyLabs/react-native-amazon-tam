#import <Foundation/Foundation.h>
#import "RNAmazonTAMInterstitial.h"

@interface RNAmazonTAMInterstitial ()

@property (nonatomic, strong) RCTPromiseResolveBlock resolve;
@property (nonatomic, strong) RCTPromiseRejectBlock reject;

@end

@implementation RNAmazonTAMInterstitial

RCT_EXPORT_MODULE(AmazonTAMInterstitial);

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

#pragma mark - Interstitial Ad
RCT_REMAP_METHOD(requestInterstitialAd,
                 slotUUID:(NSString *)slotUUID
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  _resolve = resolve;
  _reject = reject;
  DTBAdSize *size = [[DTBAdSize alloc] initInterstitialAdSizeWithSlotUUID:slotUUID];
  DTBAdLoader *adLoader = [DTBAdLoader new];
  [adLoader setSizes:size, nil];
  [adLoader loadAd:self];
}

#pragma mark - DTBAdCallback
- (void)onFailure: (DTBAdError)error {
  NSString *message = @"Failed to load interstitial ad from Amazon.";
  NSError *errorResponse = [[NSError alloc] initWithDomain:@"RNAmazonTAMInterstitial" code:error userInfo:@{NSLocalizedDescriptionKey: message}];
  if (_reject) {
    _reject(@"FAILED_TO_LOAD", message, errorResponse );
    _reject = nil;
  }
}

- (void)onSuccess: (DTBAdResponse *)adResponse {
  if (_resolve) {
    _resolve(adResponse.customTargeting);
    _resolve = nil;
  }
}

@end
