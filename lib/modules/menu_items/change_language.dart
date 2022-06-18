import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:flutter/material.dart';


class ChangeLanguageMenuItem extends StatelessWidget {
  const ChangeLanguageMenuItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'change lang'.tr(),
      icon: Icons.translate,
      onTap: (){
        showCustomDialog(
          title: 'change lang'.tr(),
          context: context,
          content: Text('sure change lang'.tr()),
          buttons: [
            DialogButton(
                title: 'cancel'.tr(),
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
            DialogButton(
                title: 'change'.tr(),
                isBold: true,
                onPressed: (){
                  changeLang(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
            ),
          ],
        );
      },
    );
  }
}
