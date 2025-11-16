import 'package:flutter/material.dart';

extension ThemeX on ThemeMode {
  bool get isSystem => this == ThemeMode.system;

  bool get isDark => this == ThemeMode.dark;

  bool get isLight => this == ThemeMode.light;
}
