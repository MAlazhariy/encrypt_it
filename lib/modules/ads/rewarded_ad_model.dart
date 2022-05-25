// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdRewarded{

  static RewardedAd? _rewardedAd;
  static bool _isAdReady = false;
  static bool adShowed = false;

  static void loadAd(){
    adShowed = false;

    RewardedAd.load(
      adUnitId: RewardedAd.testAdUnitId,
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

  static void showAd(BuildContext context){

    if(_isAdReady && _rewardedAd != null){
      _rewardedAd!.show(
          onUserEarnedReward: (ad, rewardItem){
            log('reward item type = ${rewardItem.type}');
            log('reward item amount = ${rewardItem.amount}');
            adShowed = true;
          }
      );
    }

    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad){
        log('ad dismissed');
        AppCubit.get(context).setButtonsPressable(true);
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error){
        ad.dispose();
      }
    );

  }

}