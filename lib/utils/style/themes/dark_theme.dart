import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

  const _scaffoldBackgroundColor = Color(0xFF303135);
ThemeData darkTheme = ThemeData(

  // material 3
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    error: kErrorColor,
    // The color to use for input validation errors, e.g. for InputDecoration.errorText.
    onError: Colors.white,
    // A color that's clearly legible when drawn on error. [...]
    shadow: Color(0xFF262626),
  ),

  scaffoldBackgroundColor: _scaffoldBackgroundColor,
  fontFamily: 'Baloo',
  focusColor: mainColor,
  primaryColor: mainColor,
  primarySwatch: mainSwatch,
  canvasColor: Colors.transparent,
  shadowColor: const Color(0xFF262626),
  appBarTheme: AppBarTheme(
    /// scaffold background color
    backgroundColor: const Color(0xFF303135),
    foregroundColor: const Color(0xFFECF0F3),
    // toolbarHeight: 23+5,
    iconTheme: IconThemeData(
      color: const Color(0xFFECF0F3),
      size: 16+5,
    ),

    /// shadow color
    shadowColor: const Color(0xFF262626),

    /// status bar color
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,

      systemNavigationBarColor: _scaffoldBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ),

    /// title style
    titleTextStyle: TextStyle(
      fontSize: 15+5,
      fontFamily: 'Baloo',
      color: const Color(0xFFECF0F3),
    ),
    surfaceTintColor: Colors.red,
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
