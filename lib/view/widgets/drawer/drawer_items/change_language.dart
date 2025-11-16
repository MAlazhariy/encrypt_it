import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_item.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/change_language_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChangeLanguageMenuItem extends StatelessWidget {
  const ChangeLanguageMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuItemWidget(
      title: 'change lang'.tr(),
      icon: Icons.translate,
      onTap: () {
        Navigator.pop(context);

        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) => const ChangeLanguageBottomSheetWidget(),
        );
      },
    );
  }
}
