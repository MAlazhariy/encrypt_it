import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    error: Color(0xFFFF4C7C),
    // The color to use for input validation errors, e.g. for InputDecoration.errorText.
    onError: Colors.white,
    // A color that's clearly legible when drawn on error. [...]
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
  appBarTheme: AppBarTheme(
    /// scaffold background color
    backgroundColor: const Color(0xFF303135),
    foregroundColor: const Color(0xFFECF0F3),
    // toolbarHeight: 23.sp,
    iconTheme: IconThemeData(
      color: const Color(0xFFECF0F3),
      size: 16.sp,
    ),

    /// shadow color
    shadowColor: const Color(0xFF262626),

    /// status bar color
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),

    /// title style
    titleTextStyle: TextStyle(
      fontSize: 15.sp,
      fontFamily: 'Cairo',
      color: const Color(0xFFECF0F3),
    ),
    surfaceTintColor: Colors.red,
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
