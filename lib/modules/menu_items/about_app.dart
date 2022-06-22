import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_button.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';

class AboutAppMenuItem extends StatelessWidget {
  const AboutAppMenuItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    
    return MenuItemWidget(
      title: 'about_app'.tr(),
      icon: MyIcons.info_circle,
      // icon: Icons.info_outlined,
      onTap: (){
        showCustomDialog(
          context: context,
          title: 'about_app'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo image
              Align(
                child: Image(
                  image: const AssetImage(
                    'assets/images/icon.png',
                  ),
                  width: 150.sp,
                  color: dialogButtonColor(context),
                ),
              ),
              // app name
              Align(
                child: Text(
                  cubit.appInfo.appName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: smallButtonsContentColor(context),
                  ),
                ),
              ),
              // app version
              Align(
                child: Text(
                  cubit.appInfo.version,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 9.sp,
                  ),
                ),
              ),

              // what is encryption
              SizedBox(height: 17.sp,),
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

              // how we protect your data
              SizedBox(height: 17.sp,),
              Text(
                'how_protect'.tr(),
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
              //           fontFamily: 'Cairo',
              //           color: titlesColor(context),
              //         ),
              //       ),
              //       TextSpan(
              //         text: 'privacy_policy'.tr(),
              //         style: TextStyle(
              //           fontSize: 12.sp,
              //           fontWeight: FontWeight.w600,
              //           fontFamily: 'Cairo',
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
              //           fontFamily: 'Cairo',
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
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
          ],
        );
      },
    );
  }
}
