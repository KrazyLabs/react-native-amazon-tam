import { NativeModules } from 'react-native';

const { AmazonTAMBanner, AmazonTAMInterstitial } = NativeModules;

export const { requestBannerAd } = AmazonTAMBanner;
export const { requestInterstitialAd } = AmazonTAMInterstitial;

export { AmazonTAMBanner, AmazonTAMInterstitial };
