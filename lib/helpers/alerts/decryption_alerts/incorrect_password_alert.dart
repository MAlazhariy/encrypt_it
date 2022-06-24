import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/shared/components/components/custom_dialogs/alert_dialog/alert_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialogs/dialog_button.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

void incorrectPasswordAlert(BuildContext context) {
  customAlertDialog(
    context: context,
    title: 'invalid password'.tr(),
    alertIcon: Icons.gpp_bad,
    alertDescription: 'invalid_password_description'.tr(),
    buttons: [
      DialogButton(
        title: 'ok'.tr(),
        onPressed: () {
          Navigator.pop(context);
        },
        isBold: true,
        color: redColor,
      ),
    ],
  );
}