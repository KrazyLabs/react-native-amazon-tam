package com.krazylabs.rnamazontam;

import android.os.Bundle;

import com.amazon.device.ads.DTBAdResponse;
import com.amazon.device.ads.DTBAdUtil;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;
import com.google.android.gms.ads.doubleclick.PublisherAdRequest;

public class RNAmazonTAMUtils {
  private static final String AMZN_B = "amzn_b";
  private static final String AMZN_H = "amzn_h";
  private static final String DC = "dc";
  private static final String AMZNNP = "amznp";
  private static final String AMZNSLOTS = "amznslots";

  static public WritableMap getCustomTargeting(DTBAdResponse dtbAdResponse) {
    final PublisherAdRequest adRequest = DTBAdUtil.INSTANCE.createPublisherAdRequestBuilder(dtbAdResponse).build();
    Bundle customTargeting = adRequest.getCustomTargeting();
    WritableMap map = Arguments.createMap();
    map.putString(AMZN_B, customTargeting.getString(AMZN_B));
    map.putString(AMZN_H, customTargeting.getString(AMZN_H));
    map.putString(DC, customTargeting.getString(DC));
    map.putString(AMZNNP, customTargeting.getString(AMZNNP));
    map.putString(AMZNSLOTS, customTargeting.getString(AMZNSLOTS));
    return map;
  }
}