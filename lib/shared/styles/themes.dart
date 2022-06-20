import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light, // A color that typically appears behind scrollable content.
    primary: mainColor, // The color displayed most frequently across your app’s screens and components.
    onPrimary: Colors.white, // A color that's clearly legible when drawn on primary. [...]
    secondary: Color(0xFF4B4453), // darkGray // An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.
    onSecondary: Color(0xFFB0A8B9), // lightGray // A color that's clearly legible when drawn on secondary. [...]
    error: Color(0xFFFF4C7C), // The color to use for input validation errors, e.g. for InputDecoration.errorText.
    onError: Colors.white, // A color that's clearly legible when drawn on error. [...]
    shadow: Color(0xFF9E9E9E),
  ),
  // change color in appBar too
  scaffoldBackgroundColor: const Color(0xFFECF0F3),
  fontFamily: 'Cairo',
  primaryColor: mainColor,
  primarySwatch: mainColor,
  errorColor: const Color(0xFFFF4C7C),
  canvasColor: Colors.transparent,
  shadowColor: const Color(0xFF9E9E9E),
  appBarTheme: AppBarTheme(
    /// scaffold background color
    backgroundColor: const Color(0xFFECF0F3),
    foregroundColor: mainColor,
    iconTheme: const IconThemeData(
      color: mainColor,
    ),
    /// shadow color
    shadowColor: const Color(0xFF9E9E9E).withAlpha(50),
    /// status bar color
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);


ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    error: Color(0xFFFF4C7C), // The color to use for input validation errors, e.g. for InputDecoration.errorText.
    onError: Colors.white, // A color that's clearly legible when drawn on error. [...]
    shadow: Color(0xFF262626),
  ),
  scaffoldBackgroundColor: const Color(0xFF303135),
  fontFamily: 'Cairo',
  focusColor: mainColor,
  primaryColor: mainColor,
  primarySwatch: mainColor,
  errorColor: const Color(0xFFFF4C7C),
  canvasColor: Colors.transparent,
  shadowColor: const Color(0xFF262626),
  appBarTheme: const AppBarTheme(
    /// scaffold background color
    backgroundColor: Color(0xFF303135),
    foregroundColor: Color(0xFFECF0F3),
    iconTheme: IconThemeData(
      color: Color(0xFFECF0F3),
    ),
    /// shadow color
    shadowColor: Color(0xFF262626),
    /// status bar color
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);
