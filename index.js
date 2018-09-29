import { NativeModules } from 'react-native';

export default { AmazonTAMBanner, AmazonTAMInterstitial } = NativeModules;

export const { requestBannerAd } = AmazonTAMBanner;
export const { requestInterstitialAd } = AmazonTAMInterstitial;
