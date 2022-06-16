import 'dart:developer';
import 'package:encryption_app/modules/ads/ad_helper.dart';
import 'package:encryption_app/shared/network/local/operation_counter_cache.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstitialAddToStore {

  static InterstitialAd? _interstitialAd;
  static bool isAdReady = false;
  // static const int _maxFailedLoadAttempts = 1;
  // static int _numBannerLoadAttempts = 0;

  static void loadAd(){
    if(OperationCounterCache.getCounter() >= 5){
      InterstitialAd.load(
          adUnitId: AdHelper.textStoreInterstitialAdId,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              isAdReady = true;
              _interstitialAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {
              log('text store InterstitialAd failed to load: ${error.message}');
              // _numBannerLoadAttempts += 1;
              // if (_numBannerLoadAttempts <= _maxFailedLoadAttempts) {
              //   loadAd();
              // }
            },
          ));
    }
  }

  static void showAd(){
    if(isAdReady){
      _interstitialAd?.show();
      isAdReady = false;
    }
  }

  static void disposeAd(){
    _interstitialAd?.dispose();
  }

}
