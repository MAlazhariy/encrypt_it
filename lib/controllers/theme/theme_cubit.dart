import 'package:encryption_app/network/local/color_theme_cache.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_bloc/flutter_bloc.dart';

/// This block is for changing the color theme
/// or anything related to rebuilding the Material widget
///
/// Using the AppCubit leads to a problem, as the Material widget is rebuilt
/// every time it goes to a state so that the application runs from the beginning
/// and this leads to some problems such as not opening the keyboard.
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void initTheme() {
    final darkMode = ThemeCache.isDarkMode();
    _setThemeFromBool(darkMode);
  }

  void _setThemeFromBool(bool? darkMode) {
    final mode = darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;

    setThemeMode(mode);
  }

  void setThemeMode(ThemeMode mode) {
    ThemeCache.setDarkMode(mode == ThemeMode.dark);
    emit(mode);
  }
}
