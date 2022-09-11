import 'package:encryption_app/view/widgets/drawer/drawer_group_items.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/about_app.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/change_language.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/dark_mode.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/disclaimer.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/rate_app.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/report_bug.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/share_app.dart';
import 'package:flutter/material.dart';

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
