import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';

const _scaffoldBackgroundColor = Color(0xFFECF0F3);

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
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
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
    // toolbarHeight: 23+5,
    iconTheme: IconThemeData(
      color: mainColor,
      size: 16+5,
    ),
    /// shadow color
    shadowColor: const Color(0xFF9E9E9E).withAlpha(50),
    /// status bar color
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,

      // systemNavigationBarColor: _scaffoldBackgroundColor,
      systemNavigationBarColor: _scaffoldBackgroundColor,
      // systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    /// title style
    titleTextStyle: TextStyle(
      fontSize: 15+5,
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
  //     fontSize: 12+5,
  //   ),
  // ),
  dividerTheme: const DividerThemeData(
    thickness: 0.3,
  ),
);