import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/modules/bottom_sheet/bottom_sheet_design.dart';
import 'package:encryption_app/shared/components/components/alert_dialog/decoding_alerts.dart';
import 'package:encryption_app/shared/components/components/rate_app.dart';
import 'package:encryption_app/shared/network/local/rate_app_cache.dart';
import 'package:flutter/material.dart';

/// Filtering data and take an action
void bottomSheetHelper(
  BuildContext context,
  bool isEncrypt,
  String msg,
  String pass,
  GlobalKey<ScaffoldState> scaffoldKey,
) {
  var cubit = AppCubit.get(context);
  // Decrypt cases
  final bool incorrectPassword = (cubit.textResult == 'invalid password'.tr());
  final bool versionNotFound = (cubit.textResult == 'version_not_found'.tr());
  final bool newerVersion =
      (cubit.textResult == 'later_version_warning_title'.tr());

  if (incorrectPassword) {
    incorrectPasswordAlert(context);
  } else if (versionNotFound) {
    versionNotFoundAlert(context);
  } else if (newerVersion) {
    laterVersionAlert(context);
  } else {
    openBottomSheet(isEncrypt, pass, scaffoldKey, context);
  }
}

void openBottomSheet(
  bool isEncrypt,
  String pass,
  GlobalKey<ScaffoldState> scaffoldKey,
  BuildContext context,
) {
  scaffoldKey.currentState
      ?.showBottomSheet(
        (context) => BottomSheetDesign(isEncrypt, pass),
      )
      .closed
      .then((_) async {
    _onCloseBottomSheet(context);
  });
}

/// This function is executed when the bottom sheet is closed
void _onCloseBottomSheet(
  BuildContext context,
) async {
  AppCubit.get(context).setCurrentFieldToNone();

  // show rating application if available
  bool readyShowInAppRate = RateCache.isReadyShowRate(inAppReview: true);
  if (readyShowInAppRate) {
    await showInAppRate();
  } else if (RateCache.isReadyShowRate()) {
    showRateDialog(context);
  } else {
    // show ad
    // AdInterstitialBottomSheet.showInterstitialAd();
  }
}
