import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

class AdNative extends StatefulWidget {
  const AdNative({Key? key}) : super(key: key);

  @override
  AdNativeState createState() => AdNativeState();
}

class AdNativeState extends State<AdNative> {
  NativeAd? nativeAd;
  bool _isAdReady = false;

  // final AdSize _adSize = AdSize(width: 50.w.toInt(), height: 41.6.w.toInt(),);
  final int maxFailedLoadAttempts = 2;
  int _numBannerLoadAttempts = 0;

  void _createNativeAd() async {
    nativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdId,
      factoryId: "listTile",
      listener: NativeAdListener(
        onAdLoaded: (_){
          setState(() {
            _isAdReady = true;
          });
        },

        onAdFailedToLoad: (ad,err){
          log('nativeAd failed to load: ${err.message}');
          _numBannerLoadAttempts += 1;
          nativeAd = null;
          if (_numBannerLoadAttempts <= maxFailedLoadAttempts) {
            _createNativeAd();
          }
        },
      ),
      request: const AdRequest(),
    );

    await nativeAd!.load();
  }

  @override
  void initState() {
    _createNativeAd();
    super.initState();
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(_isAdReady && nativeAd != null){
      return Column(
        children: [
          // SizedBox(height: 8.sp,),
          const Divider(),

          Container(
            // height: 30.w,
            // width: 60.w,
            alignment: Alignment.center,
            child: AdWidget(ad: nativeAd!),
          ),

          const Divider(),
        ],
      );
    }

    return Container();
  }
}


