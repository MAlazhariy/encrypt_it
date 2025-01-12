import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangeLanguageMenuItem extends StatelessWidget {
  const ChangeLanguageMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'change lang'.tr(),
      icon: Icons.translate,
      onTap: () {
        showCustomDialog(
          title: 'change lang'.tr(),
          context: context,
          content: Text(
            'sure change lang'.tr(),
            style: TextStyle(
              fontSize: 13+5,
            ),
          ),
          buttons: [
            DialogButton(
                title: 'cancel'.tr(),
                onPressed: () {
                  Navigator.pop(context);
                }),
            DialogButton(
                title: 'change'.tr(),
                isBold: true,
                onPressed: () {
                  changeLang(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }
}
