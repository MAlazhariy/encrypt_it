import 'dart:developer';
import 'package:encryption_app/shared/network/local/operation_counter_cache.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../models/ads/ad_helper.dart';

class AdBanner extends StatefulWidget {
  const AdBanner({Key key}) : super(key: key);

  @override
  _AdBannerState createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  BannerAd bannerAd;
  bool _isAdReady = false;
  final AdSize _adSize = AdSize.banner;
  final int maxFailedLoadAttempts = 2;
  int _numBannerLoadAttempts = 0;

  void _createBannerAd(){
    bannerAd = BannerAd(
      size: _adSize,
      adUnitId: AdHelper.mainBannerAdId,
      listener: BannerAdListener(
        onAdLoaded: (_){
          setState(() {
            _isAdReady = true;
          });
        },

        onAdFailedToLoad: (ad,err){
          log('bannerAd failed to load: ${err.message}');
          _numBannerLoadAttempts += 1;
          if (_numBannerLoadAttempts <= maxFailedLoadAttempts) {
            _createBannerAd();
          }
        },
      ),
      request: const AdRequest(),
    );

    bannerAd.load();
  }

  @override
  void initState() {
    _createBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if(_isAdReady && OperationCounterCache.getCounter()>=2){
      return Container(
        height: _adSize.height.toDouble(),
        width: _adSize.width.toDouble(),
        child: AdWidget(ad: bannerAd),
        alignment: Alignment.center,
      );
    }

    return Container();
  }
}


