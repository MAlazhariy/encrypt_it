import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/modules/menu_items/rate_app.dart';
import 'package:encryption_app/modules/menu_items/menu_background_image.dart';
import 'package:encryption_app/shared/components/components/menu/menu_group_items.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'menu_items/about_app.dart';
import 'menu_items/disclaimer.dart';
import 'menu_items/report_bug.dart';
import 'menu_items/share_app.dart';
import 'menu_items/change_language.dart';


class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer(this.cubit, {key}) : super(key: key);

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: contrastColor,
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const MenuBG(),
            const Divider(),

            /// change language group
            MenuGroupItems([
              ChangeLanguageMenuItem(cubit),
            ]),
            const Divider(),

            /// app group
            MenuGroupItems([
              const RateAppMenuItem(),
              const ShareAppMenuItem(),
              AboutAppMenuItem(cubit),
              const DisclaimerMenuItem(),
              ReportABugMenuItem(cubit.appInfo.version),
            ]),
            const Divider(),

            /// thanks
            // const ThanksGroup(),
          ],
        ),
      ),
    );
  }
}


