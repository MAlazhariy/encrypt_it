import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Theme;

extension ContextX on BuildContext {
  Size get querySize => MediaQuery.sizeOf(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isArabic => locale.languageCode == 'ar';

  bool get isTablet => querySize.shortestSide >= 650;

  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;
}
