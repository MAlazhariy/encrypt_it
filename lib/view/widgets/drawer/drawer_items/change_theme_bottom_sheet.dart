import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/controllers/theme/theme_cubit.dart';
import 'package:encryption_app/utils/extensions/theme_extension.dart';
import 'package:encryption_app/view/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:encryption_app/view/widgets/selectable_icon_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeBottomSheetWidget extends StatelessWidget {
  const ChangeThemeBottomSheetWidget({super.key});

  Future<void> _changeTheme(ThemeMode themeMode, BuildContext context) async {
    context.read<ThemeCubit>().setThemeMode(themeMode);
    await Future.delayed(const Duration(milliseconds: 500));
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return AppBottomSheet(
          title: 'theme_app_theme'.tr(),
          children: [
            SelectableIconOption(
              title: 'theme_light_mode'.tr(),
              icon: Icons.light_mode_outlined,
              isSelected: state.isLight,
              onTap: () {
                _changeTheme(ThemeMode.light, context);
              },
            ),
            SelectableIconOption(
              title: 'theme_dark_mode'.tr(),
              icon: Icons.dark_mode_outlined,
              isSelected: state.isDark,
              onTap: () {
                _changeTheme(ThemeMode.dark, context);
              },
            ),
            SelectableIconOption(
              title: 'theme_system_mode'.tr(),
              icon: Icons.brightness_auto_outlined,
              isSelected: state.isSystem,
              onTap: () {
                _changeTheme(ThemeMode.system, context);
              },
            ),
          ],
        );
      },
    );
  }
}
