import { NativeModules } from 'react-native';

const { AmazonTam } = NativeModules;

export const { requestBannerAd, requestInterstitialAd } = AmazonTam;

export default AmazonTam;
