import 'dart:developer';
import 'package:encryption_app/utils/helpers/ad_helper.dart';
import 'package:encryption_app/network/local/operation_counter_cache.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstitialEditStore {
  static InterstitialAd? _interstitialAd;
  static bool isAdReady = false;

  static Future<void> loadAd() async {
    if (OperationCounterCache.getCounter() >= 5) {
      await InterstitialAd.load(
        adUnitId: AdIdHelper.interstitialAd,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            isAdReady = true;
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (error) {
            log('bottomSheet interstitial ad failed to load: ${error.message}');
          },
        ),
      );
    }
  }

  static Future<void> showAd() async {
    if (_interstitialAd == null) {
      await loadAd();
    }
    if (isAdReady) {
      _interstitialAd?.show();
    }
  }

  static void disposeAd() {
    _interstitialAd?.dispose();
  }
}
