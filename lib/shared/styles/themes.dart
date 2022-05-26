import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  /// for more details see: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light, // A color that typically appears behind scrollable content.
    primary: mainColor, // The color displayed most frequently across your app’s screens and components.
    onPrimary: Colors.white, // A color that's clearly legible when drawn on primary. [...]
    secondary: Colors.red, // An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.
    onSecondary: Colors.white, // A color that's clearly legible when drawn on secondary. [...]
    error: redColor, // The color to use for input validation errors, e.g. for InputDecoration.errorText.
    onError: Colors.white, // A color that's clearly legible when drawn on error. [...]
    background: Colors.white, // A color that typically appears behind scrollable content.
    onBackground: lightGrayColor, // A color that's clearly legible when drawn on background. [...]
    surface: lightGrayColor, // The background color for widgets like Card.
    onSurface: mainColor, // A color that's clearly legible when drawn on surface. [...]
    shadow: shadowColor,
  ),
  scaffoldBackgroundColor: const Color(0xFFEEEEEE),
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

ThemeData darkTheme = ThemeData(
  /// for more details see: https://api.flutter.dev/flutter/material/ColorScheme-class.html
  colorScheme: const ColorScheme.dark(),
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
  scaffoldBackgroundColor: Colors.grey.shade800,
);
