import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/view/widgets/rate_app.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';

class RateAppMenuItem extends StatelessWidget {
  const RateAppMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'rate_app_title'.tr(),
      icon: MyIcons.star,
      // icon: Icons.favorite_outline,
      onTap: () {
        rateOpenGoogle();
      },
    );
  }
}
