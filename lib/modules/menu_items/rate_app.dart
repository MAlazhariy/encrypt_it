import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/shared/components/components/menu/menu_item.dart';
import 'package:encryption_app/shared/components/components/rate_app.dart';
import 'package:flutter/material.dart';

class RateAppMenuItem extends StatelessWidget {
  const RateAppMenuItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'rate_app_title'.tr(),
      // icon: Icons.star_border,
      icon: Icons.favorite_outline,
      onTap: (){
        rateOpenGoogle();
      },
    );
  }
}
