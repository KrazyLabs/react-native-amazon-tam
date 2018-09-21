# react-native-amazon-tam

This library is a thin wrapper around the iOS and Android Amazon SDK for Amazon Publisher Services (APS). This library requires an APS account and the installation of the Amazon iOS and Android SDK. Before installing this library please follow Amazon's install instructions [here](https://ams.amazon.com/webpublisher/uam/docs/mobile-integration-documentation/dfp-integration.html).

**NOTE**
It's important that you save the Amazon iOS SDK to `[your project's name]/ios/Frameworks/`. That is where this package looks for Amazon's `DTBiOSSDK.framework`.

## Getting started

`$ npm install react-native-amazon-tam --save`

### Mostly automatic installation

`$ react-native link react-native-amazon-tam`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-amazon-tam` and add `RNAmazonTam.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNAmazonTam.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`

- Add `import com.reactlibrary.RNAmazonTamPackage;` to the imports at the top of the file
- Add `new RNAmazonTamPackage()` to the list returned by the `getPackages()` method

2. Append the following lines to `android/settings.gradle`:
   ```
   include ':react-native-amazon-tam'
   project(':react-native-amazon-tam').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-amazon-tam/android')
   ```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
   ```
     implementation project(':react-native-amazon-tam')
   ```

## Usage

### Banner Ad

To request a banner ad from APS, use `requestBannerAd(width: Int, height: Int, slotUUID: String)`.

```javascript
import { requestBannerAd } from 'react-native-amazon-tam';

const ad = await requestBannerAd(320, 50, 'your-slot-uuid');
```

### Interstitial Ad

To request a banner ad from APS, use `requestInterstitialAd(slotUUID: String)`.

```javascript
import { requestInterstitialAd } from 'react-native-amazon-tam';

const ad = await requestInterstitialAd('your-slot-uuid');
```
