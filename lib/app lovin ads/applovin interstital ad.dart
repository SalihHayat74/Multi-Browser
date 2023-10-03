import 'dart:io';
import 'dart:math';

import 'package:applovin_max/applovin_max.dart';

class MyAppLovinInterstialAd{
  final String _interstitial_ad_unit_id = Platform.isAndroid ? "65889a76af3edf88" : "IOS_INTER_AD_UNIT_ID";

  var _interstitialRetryAttempt = 0;
  bool isReady = false;
  void isAdReady()async{
    isReady = (await AppLovinMAX.isInterstitialReady(_interstitial_ad_unit_id))!;
    if(isReady){
      AppLovinMAX.showInterstitial(_interstitial_ad_unit_id);
    }
  }


  void initializeInterstitialAds() {

    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialReady(_interstitial_ad_unit_id) will now return 'true'
        print('Interstitial ad loaded from ' + ad.networkName);

        // Reset retry attempt
        _interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        _interstitialRetryAttempt = _interstitialRetryAttempt + 1;

        int retryDelay = pow(2, min(6, _interstitialRetryAttempt)).toInt();

        print('Interstitial ad failed to load with code ' + error.code.toString() + ' - retrying in ' + retryDelay.toString() + 's');

        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        });
      },
      onAdDisplayedCallback: (ad) {

      },
      onAdDisplayFailedCallback: (ad, error) {

      },
      onAdClickedCallback: (ad) {

      },
      onAdHiddenCallback: (ad) {

      },
    ));

    // Load the first interstitial
    AppLovinMAX.loadInterstitial("65889a76af3edf88");
  }



}