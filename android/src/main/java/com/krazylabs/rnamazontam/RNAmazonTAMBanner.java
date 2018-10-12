package com.krazylabs.rnamazontam;

import android.os.Bundle;
import android.util.Log;

import com.amazon.device.ads.AdError;
import com.amazon.device.ads.DTBAdCallback;
import com.amazon.device.ads.DTBAdRequest;
import com.amazon.device.ads.DTBAdResponse;
import com.amazon.device.ads.DTBAdSize;
import com.amazon.device.ads.DTBAdUtil;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.google.android.gms.ads.doubleclick.PublisherAdRequest;

public class RNAmazonTAMBanner extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNAmazonTAMBanner(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "AmazonTAMBanner";
  }

  @ReactMethod
  public void requestBannerAd(int width, int height, String slotUUID, final Promise promise) {

    final DTBAdRequest loader = new DTBAdRequest();
    loader.setSizes(new DTBAdSize(width, height, slotUUID));

    loader.loadAd(new DTBAdCallback() {
      @Override
      public void onFailure(AdError adError) {
        String code = adError.getCode().toString();
        String message = "Failed to load banner ad from Amazon: " + adError.getMessage();
        Log.e(code, message);
        promise.reject(code, message);
      }

      @Override
      public void onSuccess(DTBAdResponse dtbAdResponse) {
        WritableMap customTargeting = RNAmazonTAMUtils.getCustomTargeting(dtbAdResponse);
        promise.resolve(customTargeting);
      }
    });
  }
}
