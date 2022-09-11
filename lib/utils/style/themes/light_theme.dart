import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';

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
  /// appBar
  appBarTheme: AppBarTheme(
    /// scaffold background color
    backgroundColor: const Color(0xFFECF0F3),
    foregroundColor: mainColor,
    // toolbarHeight: 23.sp,
    iconTheme: IconThemeData(
      color: mainColor,
      size: 16.sp,
    ),
    /// shadow color
    shadowColor: const Color(0xFF9E9E9E).withAlpha(50),
    /// status bar color
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    /// title style
    titleTextStyle: TextStyle(
      fontSize: 15.sp,
      fontFamily: 'Cairo',
      color: mainColor,
    ),
  ),
  /// drawer width
  drawerTheme: DrawerThemeData(
    width: 70.w,
  ),
  /// text button
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 12.sp,
    ),
  ),
);