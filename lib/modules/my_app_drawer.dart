import 'package:encryption_app/modules/menu_items/rate_app.dart';
import 'package:encryption_app/modules/menu_items/menu_background_image.dart';
import 'package:encryption_app/shared/components/components/menu/menu_group_items.dart';
import 'package:flutter/material.dart';
import 'menu_items/about_app.dart';
import 'menu_items/disclaimer.dart';
import 'menu_items/report_bug.dart';
import 'menu_items/share_app.dart';
import 'menu_items/change_language.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            MenuBG(),
            Divider(),

            /// change language group
            MenuGroupItems([
              ChangeLanguageMenuItem(),
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
    );
  }
}
