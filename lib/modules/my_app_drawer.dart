import 'package:encryption_app/modules/menu/change_theme.dart';
import 'package:encryption_app/modules/menu/rate_app.dart';
import 'package:encryption_app/shared/components/components/menu/menu_group_items.dart';
import 'package:flutter/material.dart';
import 'menu/about_app.dart';
import 'menu/disclaimer.dart';
import 'menu/report_bug.dart';
import 'menu/share_app.dart';
import 'menu/change_language.dart';

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
