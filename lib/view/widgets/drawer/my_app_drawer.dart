import 'package:encryption_app/view/widgets/drawer/drawer_background_image.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_group_items.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/change_language.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/contact_us.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/dark_mode.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/how_app_works.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/rate_app.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/share_app.dart';
import 'package:flutter/material.dart';


// todo: clean code for the encryption algorithm.
// todo: add "HOW TO USE THE APP?" to the menu (1. type the text in the encription field, 2. ...etc)
// todo: disable decryption button if the input is not an "encrypted text"

// todo: [optional] add "desclaimer" to show how the app work and prefer to use strong algorithms instead of the application

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

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
              MenuBG(),
              // Divider(),

              /// change language group
              MenuGroupItems([
                ChangeLanguageMenuItem(),
                ChangeThemeMenuItem(),
              ]),
              Divider(),

              /// app group
              MenuGroupItems([
                HowAppWorksMenuItem(),
                RateAppMenuItem(),
                ShareAppMenuItem(),
                // DisclaimerMenuItem(),
                ContactUsMenuItem(),
              ]),
              Divider(),

              /// others
              // MenuGroupItems([
              //   AboutDeveloperMenuItem(),
              // ]),
              // Divider(),

              /// thanks
              // const ThanksGroup(),
            ],
          ),
        ),
      ),
    );
  }
}
