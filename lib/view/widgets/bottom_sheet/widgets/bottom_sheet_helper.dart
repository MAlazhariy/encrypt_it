import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/view/widgets/alert_dialogs/decryption_alerts/incorrect_password_alert.dart';
import 'package:encryption_app/view/widgets/alert_dialogs/decryption_alerts/newer_version_alert.dart';
import 'package:encryption_app/view/widgets/alert_dialogs/decryption_alerts/version_not_found_alert.dart';
import 'package:encryption_app/view/widgets/bottom_sheet/widgets/open_bottom_sheet_helper.dart';
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
    newerVersionAlert(context);
  } else {
    openBottomSheet(isEncrypt, pass, scaffoldKey, context);
  }
}
