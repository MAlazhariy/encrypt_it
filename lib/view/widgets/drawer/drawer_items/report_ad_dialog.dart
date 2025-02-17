import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

void showReportAdDialog(BuildContext context) {
  showCustomDialog(
    context: context,
    title: 'report_an_ad'.tr(),
    content: Text(
      'report_an_ad_description'.tr(),
      style: TextStyle(
        fontSize: 12+5,
      ),
    ),
    buttons: [
      DialogButton(
          title: 'back'.tr(),
          onPressed: () {
            Navigator.pop(context);
          }),
      DialogButton(
        title: 'report'.tr(),
        isBold: true,
        onPressed: () async {
          await launchUrl(
            Links.mailUs(
              subject: 'report_an_ad'.tr(),
              body: 'report_ad_mail_body'.tr(),
            ),
          ).then((value) => Navigator.pop(context));
        },
      ),
    ],
  );
}
