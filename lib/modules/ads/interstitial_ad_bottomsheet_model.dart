import 'dart:developer';

import 'package:encryption_app/models/ads/ad_helper.dart';
import 'package:encryption_app/shared/network/local/operation_counter_cache.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstitialBottomSheet {

  static InterstitialAd _interstitialAd;
  static bool isAdReady = false;


  static void loadInterstitialAd(){
    if(OperationCounterCache.getCounter()>=5){
      InterstitialAd.load(
        adUnitId: AdHelper.bottomSheetInterstitialAdId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad){
            isAdReady = true;
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (error){
            log('bottomSheet interstitial ad failed to load: ${error.message}');
          },
        ),
      );
    }
  }

  static void showInterstitialAd(){
    if(isAdReady){
      _interstitialAd.show();
    }
  }

}