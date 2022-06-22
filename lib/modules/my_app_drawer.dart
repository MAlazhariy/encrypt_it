// ignore_for_file: unused_import

import 'package:encryption_app/modules/menu_items/about_app.dart';
import 'package:encryption_app/modules/menu_items/change_language.dart';
import 'package:encryption_app/shared/components/components/menu/menu_group_items.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'menu_items/dark_mode.dart';
import 'menu_items/disclaimer.dart';
import 'menu_items/rate_app.dart';
import 'menu_items/report_bug.dart';
import 'menu_items/share_app.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              // MenuBG(),
              // Divider(),

              /// change language group
              MenuGroupItems([
                ChangeLanguageMenuItem(),
                ChangeThemeMenuItem(),
              ]),
              Divider(),

              /// app group
              MenuGroupItems([
                RateAppMenuItem(),
                ShareAppMenuItem(),
                AboutAppMenuItem(),
                DisclaimerMenuItem(),
                ReportABugMenuItem(),
              ]),
              Divider(),

              /// thanks
              // const ThanksGroup(),
            ],
          ),
        ),
      ),
    );
  }
}
