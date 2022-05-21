import 'dart:developer';

import 'package:encryption_app/cubit/cubit.dart';
import 'package:encryption_app/models/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdRewarded{

  static RewardedAd _rewardedAd;
  static bool _isAdReady = false;
  static bool adShowed = false;

  static void loadAd(){
    adShowed = false;

    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad){
          _rewardedAd = ad;
          _isAdReady = true;
        },
        onAdFailedToLoad: (error){
          log('failed to load rewarded ad: ${error.message}');
        },
      ),
    );

  }

  static void showAd(AppCubit cubit){

    if(_isAdReady){
      _rewardedAd.show(
          onUserEarnedReward: (ad, rewardItem){
            log('reward item type = ${rewardItem.type}');
            log('reward item amount = ${rewardItem.amount}');
            adShowed = true;
          }
      );
    }

    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad){
        log('ad dismissed');
        cubit.buttonsPressable(true);
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error){
        ad.dispose();
      }
    );

  }

}