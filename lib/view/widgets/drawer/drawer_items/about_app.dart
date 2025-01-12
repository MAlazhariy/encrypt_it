import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';

class AboutAppMenuItem extends StatelessWidget {
  const AboutAppMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'about_app'.tr(),
      icon: MyIcons.info_circle,
      // icon: Icons.info_outlined,
      onTap: () {
        showCustomDialog(
          context: context,
          title: 'about_app'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // what is encryption
              Text(
                'onBoard_headline_1'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12+5,
                ),
              ),
              Text(
                'onBoard_subtitle_1'.tr(),
                style: TextStyle(
                  fontSize: 12+5,
                ),
              ),

              // how we protect your data
              SizedBox(
                height: 17+5,
              ),
              Text(
                'how_protect'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12+5,
                ),
              ),
              Text(
                'how_protect_description'.tr(),
                style: TextStyle(
                  fontSize: 12+5,
                ),
              ),

              // // privacy policy
              // SizedBox(height: 17+5,),
              // Text(
              //   'privacy_policy'.tr(),
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 12+5,
              //   ),
              // ),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: 'privacy_policy_description'.tr(),
              //         style: TextStyle(
              //           fontSize: 12+5,
              //           fontWeight: FontWeight.w500,
              //           fontFamily: 'Baloo',
              //           color: titlesColor(context),
              //         ),
              //       ),
              //       TextSpan(
              //         text: 'privacy_policy'.tr(),
              //         style: TextStyle(
              //           fontSize: 12+5,
              //           fontWeight: FontWeight.w600,
              //           fontFamily: 'Baloo',
              //           color: smallButtonsContentColor(context),
              //           decoration: TextDecoration.underline,
              //         ),
              //         recognizer: TapGestureRecognizer()..onTap = () async {
              //           await launchUrl(Links.privacyPolicy);
              //         },
              //       ),
              //       TextSpan(
              //         text: '.',
              //         style: TextStyle(
              //           fontSize: 12+5,
              //           fontWeight: FontWeight.w500,
              //           color: titlesColor(context),
              //           fontFamily: 'Baloo',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              /**/

              // // how we protect your data
              // SizedBox(height: 17+5,),
              // Text(
              //   'how_protect'.tr(),
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 12+5,
              //   ),
              // ),
              // Text(
              //   'how_protect_description'.tr(),
              //   style: TextStyle(
              //     fontSize: 13+5,
              //   ),
              // ),
            ],
          ),
          buttons: [
            DialogButton(
                title: 'back'.tr(),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }
}
