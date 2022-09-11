
import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/view/widgets/rate_app.dart';
import 'package:encryption_app/network/local/rate_app_cache.dart';
import 'package:flutter/material.dart';

/// This function is executed when the bottom sheet is closed
void onCloseBottomSheet(BuildContext context) async {
  AppCubit.get(context).setCurrentFieldToNone();

  // show rating application if available
  bool readyShowInAppRate = RateCache.isReadyShowRate(inAppReview: true);
  if (readyShowInAppRate) {
    await showInAppRate();
  } else if (RateCache.isReadyShowRate()) {
    showRateDialog(context);
  }
}