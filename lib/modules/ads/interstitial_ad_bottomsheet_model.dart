import 'dart:developer';
import 'package:encryption_app/modules/ads/ad_helper.dart';
import 'package:encryption_app/shared/network/local/operation_counter_cache.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstitialBottomSheet {

  static InterstitialAd? _interstitialAd;
  static bool isAdReady = false;


  static Future<void> loadInterstitialAd() async {
    if(OperationCounterCache.getCounter()>=5){
      await InterstitialAd.load(
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

  static void showInterstitialAd() async {
    if(_interstitialAd == null) {
      await loadInterstitialAd();
    }
    if(isAdReady){
      _interstitialAd?.show();
    }
  }

}