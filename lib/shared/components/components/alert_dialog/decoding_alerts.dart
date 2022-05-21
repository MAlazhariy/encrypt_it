import 'package:encryption_app/shared/components/components/alert_dialog/custom_alert_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_undefined_chars_alert_dialog.dart';

// password alert dialog


// encryption alert dialogs
void invalidCharactersAlert({
  @required BuildContext context,
  @required String undefinedChars,
}){
  customUndefinedCharsAlertDialog(
    context: context,
    title: 'undefined_chars'.tr(),
    alertIcon: Icons.warning_amber_rounded,
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
                  fontFamily: 'Cairo',
                  color: Colors.grey[800],
                ),
              ),
              TextSpan(
                text: undefinedChars,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cairo',
                  color: Colors.grey[900],
                ),
              ),
              TextSpan(
                text: '"',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Cairo',
                  color: Colors.grey[800],
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
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'contact_us'.tr(),
                style: TextStyle(
                  fontSize: 11.sp,
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () async {
                  await launch(Links.mailUs(
                    subject: 'report_bug'.tr() + ' - ' + 'undefined_chars'.tr(),
                  ));
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
        onPressed: (){
          Navigator.pop(context);
        },
        isBold: true,
        color: redColor,
      ),
    ],
  );
}

// decryption bottom sheet alert dialogs
void incorrectPasswordAlert(BuildContext context){
  customAlertDialog(
    context: context,
    title: 'invalid password'.tr(),
    alertIcon: Icons.gpp_bad,
    alertDescription: 'invalid_password_description'.tr(),
    buttons: [
      DialogButton(
        title: 'ok'.tr(),
        onPressed: (){
          Navigator.pop(context);
        },
        isBold: true,
        color: redColor,
      ),
    ],
  );
}
void versionNotFoundAlert(BuildContext context){
  customAlertDialog(
    context: context,
    title: 'version_not_found'.tr(),
    alertIcon: Icons.error_outline,
    alertDescription: 'version_not_found_description'.tr(),
    buttons: [
      DialogButton(
        title: 'ok'.tr(),
        onPressed: (){
          Navigator.pop(context);
        },
        isBold: true,
        color: redColor,
      ),
    ],
  );
}
void laterVersionAlert(BuildContext context){
  customAlertDialog(
    context: context,
    title: 'later_version_warning_title'.tr(),
    // alertIcon: Icons.warning_amber_rounded,
    alertIcon: Icons.update,
    alertDescription: 'later_version_warning_message'.tr(),
    buttons: [
      DialogButton(
        title: 'cancel'.tr(),
        onPressed: (){
          Navigator.pop(context);
        },
        isBold: false,
        color: redColor,
      ),
      DialogButton(
        title: 'update_app'.tr(),
        onPressed: () async {
          await launch(Links.appOnGooglePlay).then((value){
            Navigator.pop(context);
          });
        },
        isBold: true,
        color: redColor,
      ),
    ],
  );
}