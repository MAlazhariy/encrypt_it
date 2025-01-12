import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/controllers/material_cubit/material_cubit.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ChangeThemeMenuItem extends StatelessWidget {
  const ChangeThemeMenuItem({super.key});


  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'dark_mode'.tr(),
      icon: Icons.dark_mode_outlined,
      suffixIcon: SizedBox(
        width: 35+5,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              MaterialCubit.get(context).changeThemeMode(value);
            },
          ),
        ),
      ),
      onTap: (){
        MaterialCubit.get(context).changeThemeMode(
            !(Theme.of(context).brightness == Brightness.dark)
        );
      },
    );
  }
}
