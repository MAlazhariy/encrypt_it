import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';

class HowAppWorksMenuItem extends StatelessWidget {
  const HowAppWorksMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'how_app_works'.tr(),
      subtitle: 'how_algorithm_works'.tr(),
      icon: MyIcons.info_circle,
      // icon: Icons.info_outlined,
      onTap: () {
        showCustomDialog(
          context: context,
          title: 'how_app_works'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // what is encryption
              Text(
                'onBoard_headline_1'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'onBoard_subtitle_1'.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 17.sp),

              // how we protect your data
              Text(
                'how_algorithm_works'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'how_protect_description'.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),

              // // privacy policy
              // SizedBox(height: 17.sp,),
              // Text(
              //   'privacy_policy'.tr(),
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 12.sp,
              //   ),
              // ),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: 'privacy_policy_description'.tr(),
              //         style: TextStyle(
              //           fontSize: 12.sp,
              //           fontWeight: FontWeight.w500,
              //           fontFamily: 'Baloo',
              //           color: titlesColor(context),
              //         ),
              //       ),
              //       TextSpan(
              //         text: 'privacy_policy'.tr(),
              //         style: TextStyle(
              //           fontSize: 12.sp,
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
              //           fontSize: 12.sp,
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
              // SizedBox(height: 17.sp,),
              // Text(
              //   'how_protect'.tr(),
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 12.sp,
              //   ),
              // ),
              // Text(
              //   'how_protect_description'.tr(),
              //   style: TextStyle(
              //     fontSize: 13.sp,
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
