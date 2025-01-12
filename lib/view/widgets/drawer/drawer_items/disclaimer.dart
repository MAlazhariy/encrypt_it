import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/report_ad_dialog.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

class DisclaimerMenuItem extends StatelessWidget {
  const DisclaimerMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'disclaimer'.tr(),
      // icon: Icons.task_alt_outlined,
      icon: MyIcons.check_circle,
      onTap: () {
        showCustomDialog(
          context: context,
          title: 'disclaimer'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'disclaimer_description'.tr(),
                style: TextStyle(
                  fontSize: 12+5,
                ),
              ),
            ],
          ),
          buttons: [
            // back
            DialogButton(
                title: 'back'.tr(),
                onPressed: () {
                  Navigator.pop(context);
                }),
            // report an ad
            DialogButton(
                title: 'report_an_ad'.tr(),
                isBold: true,
                onPressed: () {
                  Navigator.pop(context);
                  showReportAdDialog(context);
                }),
          ],
        );
      },
    );
  }
}
