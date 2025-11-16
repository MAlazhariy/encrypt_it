import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/view/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:encryption_app/view/widgets/selectable_icon_option.dart';
import 'package:flutter/material.dart';

class ChangeLanguageBottomSheetWidget extends StatelessWidget {
  const ChangeLanguageBottomSheetWidget({super.key});

  Future<void> _changeLanguage(String languageCode, BuildContext context) async {
    if (languageCode == 'ar') {
      context.locale = const Locale('ar');
    } else {
      context.locale = const Locale('en');
    }
    await Future.delayed(const Duration(milliseconds: 600));
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentLang = getCurrentLang(context);
    final isArabic = currentLang == 'ar';
    final isEnglish = currentLang == 'en';

    return AppBottomSheet(
      title: 'change lang'.tr(),
      children: [
        SelectableIconOption(
          title: 'language_arabic'.tr(),
          icon: Icons.translate,
          isSelected: isArabic,
          onTap: () {
            _changeLanguage('ar', context);
          },
        ),
        SelectableIconOption(
          title: 'language_english'.tr(),
          icon: Icons.language,
          isSelected: isEnglish,
          onTap: () {
            _changeLanguage('en', context);
          },
        ),
      ],
    );
  }
}

