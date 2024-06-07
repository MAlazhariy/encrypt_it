import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/view/widgets/custom_dialog/alert_dialog/undefined_chars_alert_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

void invalidCharactersAlert({
  required BuildContext context,
  required String undefinedChars,
}) {
  customUndefinedCharsAlertDialog(
    context: context,
    title: 'contains_undefined_chars'.tr(),
    alertIcon: MyIcons.error_amber,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'undefined_chars_description'.tr(),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '"',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Baloo',
                  color: titlesColor(context),
                ),
              ),
              TextSpan(
                text: undefinedChars,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Baloo',
                  color: titlesColor(context),
                  // color: Colors.grey[900],
                ),
              ),
              TextSpan(
                text: '"',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Baloo',
                  color: titlesColor(context),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'there_problem'.tr(),
                style: TextStyle(
                  fontSize: 11.sp,
                  color: titlesColor(context),
                ),
              ),
              TextSpan(
                text: 'contact_us'.tr(),
                style: TextStyle(
                  fontSize: 11.sp,
                  color: smallButtonsContentColor(context),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launchUrl(
                      Links.mailUs(
                        subject:
                            '${'undefined_chars'.tr()} - ${AppCubit.get(context).appInfo.version}',
                        body: 'undefined_chars_mail'.tr(args: [undefinedChars]),
                      ),
                    );
                  },
              ),
              TextSpan(
                text: '.',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
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
