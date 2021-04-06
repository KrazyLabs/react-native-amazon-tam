#import <Foundation/Foundation.h>
#import "RNAmazonTAMBanner.h"

@interface RNAmazonTAMBanner ()

@property (nonatomic, strong) RCTPromiseResolveBlock resolve;
@property (nonatomic, strong) RCTPromiseRejectBlock reject;

@end

@implementation RNAmazonTAMBanner

RCT_EXPORT_MODULE(AmazonTAMBanner);

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

#pragma mark - Banner Ad
RCT_REMAP_METHOD(requestBannerAd,
                 width:(int)width
                 height:(int)height
                 slotUUID:(NSString *)slotUUID
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  _resolve = resolve;
  _reject = reject;
  DTBAdSize *size = [[DTBAdSize alloc] initBannerAdSizeWithWidth:width height:height andSlotUUID:slotUUID];
  DTBAdLoader *adLoader = [DTBAdLoader new];
  [adLoader setSizes:size, nil];
  [adLoader loadAd:self];
}

#pragma mark - DTBAdCallback
- (void)onFailure: (DTBAdError)error {
  NSString *message = @"Failed to load banner ad from Amazon.";
  NSError *errorResponse = [[NSError alloc] initWithDomain:@"RNAmazonTAMBanner" code:error userInfo:@{NSLocalizedDescriptionKey: message}];
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
