import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloperMenuItem extends StatelessWidget {
  const AboutDeveloperMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'about_developer'.tr(),
      icon: Icons.person_outline,
      onTap: () {
        showCustomDialog(
          context: context,
          title: 'Mostafa Alazhariy',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'about_developer'.tr(),
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 12.sp,
              //   ),
              // ),
              Text(
                'developer_summary'.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),

              // how we protect your data
              SizedBox(
                height: 14.sp,
              ),
              Text(
                'social_media'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(MyIcons.linkedin),
                    onPressed: () async => launchUrl(Links.linkedInProfile, mode: LaunchMode.externalApplication),
                  ),
                  IconButton(
                    icon: const Icon(MyIcons.github),
                    onPressed: () async => launchUrl(Links.gitHubProfile, mode: LaunchMode.externalApplication),
                  ),
                  // IconButton(
                  //   icon: const Icon(MyIcons.youtube),
                  //   onPressed: () async => launchUrl(Links.youtubeChannel),
                  // ),
                ],
              ),
            ],
          ),
          buttons: [
            DialogButton(
              title: 'back'.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
