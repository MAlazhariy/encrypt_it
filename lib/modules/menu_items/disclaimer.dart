import 'package:encryption_app/modules/menu_items/report_ad_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DisclaimerMenuItem extends StatelessWidget {
  const DisclaimerMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'disclaimer'.tr(),
      icon: Icons.task_alt_outlined,
      // icon: Icons.wysiwyg_outlined,
      onTap: (){
        showCustomDialog(
          context: context,
          title: 'disclaimer'.tr(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'disclaimer_description'.tr(),
              ),
            ],
          ),
          buttons: [
            // back
            DialogButton(
                title: 'back'.tr(),
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
            // report an ad
            DialogButton(
                title: 'report_an_ad'.tr(),
                isBold: true,
                onPressed: (){
                  Navigator.pop(context);
                  showReportAdDialog(context);
                }
            ),
          ],
        );
      },
    );
  }
}
