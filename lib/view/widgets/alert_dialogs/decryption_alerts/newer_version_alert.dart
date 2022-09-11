import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/view/widgets/custom_dialog/alert_dialog/alert_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void newerVersionAlert(BuildContext context) {
  customAlertDialog(
    context: context,
    title: 'later_version_warning_title'.tr(),
    // alertIcon: Icons.warning_amber_rounded,
    alertIcon: MyIcons.share_up,
    alertDescription: 'later_version_warning_message'.tr(),
    buttons: [
      DialogButton(
        title: 'cancel'.tr(),
        onPressed: () {
          Navigator.pop(context);
        },
        isBold: false,
        color: redColor,
      ),
      DialogButton(
        title: 'update_app'.tr(),
        onPressed: () async {
          await launchUrl(
            Links.appOnGooglePlay,
          ).then((value) {
            Navigator.pop(context);
          });
        },
        isBold: true,
        color: redColor,
      ),
    ],
  );
}
