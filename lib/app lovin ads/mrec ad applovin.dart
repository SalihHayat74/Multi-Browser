


import 'dart:io';

import 'package:applovin_max/applovin_max.dart';

class MrecAd{

  final String _mrec_ad_unit_id = Platform.isAndroid ? "37de30427233c136" : "IOS_MREC_AD_UNIT_ID";

  void initializeMRecAds()
  {
    // MRECs are sized to 300x250 on phones and tablets
    AppLovinMAX.createMRec(_mrec_ad_unit_id, AdViewPosition.bottomCenter);
  }

  final String _ad_unit_id =  "37de30427233c136";


  MaxAdView mrecAdWidget =   MaxAdView(
  adUnitId: "37de30427233c136",
  adFormat: AdFormat.mrec,
  listener: AdViewAdListener(onAdLoadedCallback: (ad) {
  }, onAdLoadFailedCallback: (adUnitId, error) {

  }, onAdClickedCallback: (ad) {

  }, onAdExpandedCallback: (ad) {

  }, onAdCollapsedCallback: (ad) {

  })
  );


}