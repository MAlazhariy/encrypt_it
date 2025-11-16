import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/change_theme_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChangeThemeMenuItem extends StatelessWidget {
  const ChangeThemeMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'theme_app_theme'.tr(),
      icon: Icons.dark_mode_outlined,
      onTap: () {
        // Use root navigator to show bottom sheet
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) => const ChangeThemeBottomSheetWidget(),
        );
      },
    );
  }
}
