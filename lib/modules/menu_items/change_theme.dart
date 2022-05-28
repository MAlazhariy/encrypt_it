import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/cubit/material_cubit/material_cubit.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:flutter/material.dart';


class ChangeThemeMenuItem extends StatelessWidget {
  const ChangeThemeMenuItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MenuItemWidget(
            title: 'dark_mode'.tr(),
            icon: Icons.dark_mode_outlined,
            onTap: (){
              MaterialCubit.get(context).changeThemeMode(
                  !(Theme.of(context).brightness == Brightness.dark)
              );
            },
          ),
        ),
        Switch(
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: (value) {
            MaterialCubit.get(context).changeThemeMode(value);
          },
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
