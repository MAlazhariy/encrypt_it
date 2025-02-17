import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ThanksMenuItem extends StatelessWidget {
  const ThanksMenuItem(this.appVersion, {Key? key}) : super(key: key);

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
                width: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.favorite_outlined,
                    color: redColor,
                    size: 20 + 5,
                  ),
                ),
              ),
              SizedBox(
                height: 15 + 5,
              ),
              Text(
                'thanks_description'.tr(),
                style: TextStyle(
                  fontSize: 11 + 5,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Divider(),
              Container(
                width: double.infinity,
                color: mainColor.withAlpha(8),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5 + 5,
                    horizontal: 5 + 5,
                  ),
                  child: Text(
                    'thanks_names'.tr(),
                    style: TextStyle(
                      fontSize: 13 + 5,
                      color: mainColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 5 + 5,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'contact_to_report'.tr(),
                      style: TextStyle(
                        fontSize: 11 + 5,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: 'facebook_page'.tr(),
                      style: TextStyle(
                        fontSize: 11 + 5,
                        color: mainColor,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await launchUrl(
                            Links.facebookPage,
                          );
                        },
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(
                        fontSize: 11 + 5,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.normal,
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
                  Navigator.pop(context);
                  await launchUrl(
                    Links.mailUs(
                      subject: '${'report_bug'.tr()} - $appVersion',
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
