

import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyAdmobRewardAds{

  RewardedInterstitialAd? myRewardedAd;
  void rewardedAd(){
    RewardedInterstitialAd.load(
        adUnitId: 'ca-app-pub-5228453034289149/2395688304',
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            this.myRewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
          },
        ));
    myRewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
          print('$ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedInterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (RewardedInterstitialAd ad) => print('$ad impression occurred.'),
    );
    myRewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
      // Reward the user for watching an ad.
    });
  }
}