

import 'dart:io';

import 'package:applovin_max/applovin_max.dart';

class MyApplovinBannerAds{

  final String _banner_ad_unit_id = Platform.isAndroid ? "665c6d5ac255ace8" : "IOS_BANNER_AD_UNIT_ID";


  void initializeBannerAds()
  {
    // Banners are automatically sized to 320x50 on phones and 728x90 on tablets
    AppLovinMAX.createBanner(_banner_ad_unit_id, AdViewPosition.bottomCenter);
  }




}