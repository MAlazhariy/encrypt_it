import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  /// for more details see: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  // colorScheme: ColorScheme(
  //   brightness: brightness, // A color that typically appears behind scrollable content.
  //   primary: primary, // The color displayed most frequently across your app’s screens and components.
  //   onPrimary: onPrimary, // A color that's clearly legible when drawn on primary. [...]
  //   secondary: secondary, // An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.
  //   onSecondary: onSecondary, // A color that's clearly legible when drawn on secondary. [...]
  //   error: error, // The color to use for input validation errors, e.g. for InputDecoration.errorText.
  //   onError: onError, // A color that's clearly legible when drawn on error. [...]
  //   background: background, // A color that typically appears behind scrollable content.
  //   onBackground: onBackground, // A color that's clearly legible when drawn on background. [...]
  //   surface: surface, // The background color for widgets like Card.
  //   onSurface: onSurface, // A color that's clearly legible when drawn on surface. [...]
  // ),
  fontFamily: 'Cairo',
  focusColor: mainColor,
  primaryColor: mainColor,
  primarySwatch: const MaterialColor(
    0xff3ab7ff,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff34a5e6), //10%
      100: Color(0xff2e92cc), //20%
      200: Color(0xff2980b3), //30%
      300: Color(0xff236e99), //40%
      400: Color(0xff1d5c80), //50%
      500: Color(0xff174966), //60%
      600: Color(0xff11374c), //70%
      700: Color(0xff0c2533), //80%
      800: Color(0xff061219), //90%
      900: Color(0xff000000), //100%
    },
  ),
  // primaryColorLight: mainColor,
  // primaryColorDark: mainColor,
  scaffoldBackgroundColor: Colors.black,
);

ThemeData lightTheme = ThemeData(
  /// for more details see: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  colorScheme: const ColorScheme(
    brightness: Brightness.light, // A color that typically appears behind scrollable content.
    primary: mainColor, // The color displayed most frequently across your app’s screens and components.
    onPrimary: Colors.white, // A color that's clearly legible when drawn on primary. [...]
    secondary: bGColor, // An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.
    onSecondary: Colors.white, // A color that's clearly legible when drawn on secondary. [...]
    error: redColor, // The color to use for input validation errors, e.g. for InputDecoration.errorText.
    onError: Colors.white, // A color that's clearly legible when drawn on error. [...]
    background: Colors.white, // A color that typically appears behind scrollable content.
    onBackground: lightGrayColor, // A color that's clearly legible when drawn on background. [...]
    surface: lightGrayColor, // The background color for widgets like Card.
    onSurface: mainColor, // A color that's clearly legible when drawn on surface. [...]
    shadow: shadowColor,
  ),
  fontFamily: 'Cairo',
  // focusColor: shadowColor,
  primaryColor: mainColor,
  primarySwatch: const MaterialColor(
    0xff3ab7ff,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff34a5e6), //10%
      100: Color(0xff2e92cc), //20%
      200: Color(0xff2980b3), //30%
      300: Color(0xff236e99), //40%
      400: Color(0xff1d5c80), //50%
      500: Color(0xff174966), //60%
      600: Color(0xff11374c), //70%
      700: Color(0xff0c2533), //80%
      800: Color(0xff061219), //90%
      900: Color(0xff000000), //100%
    },
  ),
  canvasColor: Colors.transparent,
);
