import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ThanksMenuItem extends StatelessWidget {
  const ThanksMenuItem(this.appVersion, {Key key}) : super(key: key);

  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'thanks'.tr(),
      icon: Icons.favorite_outline,
      onTap: () {
        showCustomDialog(
          context: context,
          title: 'thanks'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Center(
                  child: Icon(
                    Icons.favorite_outlined,
                    color: redColor,
                    size: 20.sp,
                  ),
                ),
                width: double.infinity,
              ),
              SizedBox(
                height: 15.sp,
              ),
              Text(
                'thanks_description'.tr(),
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.sp,
                    horizontal: 5.sp,
                  ),
                  child: Text(
                    'thanks_names'.tr(),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                width: double.infinity,
                color: bGColor.withAlpha(15),
              ),
              const Divider(),
              SizedBox(
                height: 5.sp,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'contact_to_report'.tr(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'facebook_page'.tr(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await launch(Links.facebookPage);
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
                title: 'back'.tr(),
                onPressed: () {
                  Navigator.pop(context);
                }),
            DialogButton(
                title: 'contact_us'.tr(),
                isBold: true,
                onPressed: () async {
                  await launch(Links.mailUs(
                    subject: 'report_bug'.tr() + ' - ' + appVersion,
                  )).then((value) {
                    Navigator.pop(context);
                  });
                }),
          ],
        );
      },
    );
  }
}
