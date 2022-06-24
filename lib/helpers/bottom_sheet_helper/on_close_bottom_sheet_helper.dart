
import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/helpers/rate_app_helper.dart';
import 'package:encryption_app/shared/network/local/rate_app_cache.dart';
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