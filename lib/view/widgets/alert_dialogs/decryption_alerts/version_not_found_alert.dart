import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/view/widgets/custom_dialog/alert_dialog/alert_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';

void versionNotFoundAlert(BuildContext context) {
  customAlertDialog(
    context: context,
    title: 'version_not_found'.tr(),
    alertIcon: MyIcons.error_circle,
    alertDescription: 'version_not_found_description'.tr(),
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
