import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: mainColor,
    onPrimary: Colors.white,
    secondary: Color(0xFF4B4453),
    onSecondary: Color(0xFFB0A8B9),
    error: kErrorColor,
    onError: Colors.white,
    shadow: Color(0xFF9E9E9E),
  ),
  // change color in appBar too
  scaffoldBackgroundColor: const Color(0xFFECF0F3),
  fontFamily: 'Baloo',
  primaryColor: mainColor,
  primarySwatch: mainSwatch,
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
      fontFamily: 'Baloo',
      color: mainColor,
    ),
  ),
  /// drawer width
  drawerTheme: DrawerThemeData(
    width: 70.w,
  ),
  /// text button
  // textTheme: TextTheme(
  //   button: TextStyle(
  //     fontSize: 12.sp,
  //   ),
  // ),
  dividerTheme: const DividerThemeData(
    thickness: 0.3,
  ),
);