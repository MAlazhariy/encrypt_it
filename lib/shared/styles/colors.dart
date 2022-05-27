import 'package:flutter/material.dart';

Color highLightColor(bool isDarkMode) {
  if (isDarkMode) return const Color(0xFF5A5A5A);
  return Colors.white;
}

const mainColor = Colors.deepPurple;
const mainSwatch = MaterialColor(
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
);
// const Color bGColor = Color(0xFFEEEEEE);
// const Color shadowColor = Color(0xFF9E9E9E);

// const Color contrastColor = Colors.white;

const Color lightGrayColor = Color(0xFFB0A8B9);
const Color darkGrayColor = Color(0xFF4B4453);
const Color redColor = Color(0xFFFF4C7C);
const Color encryptedTextColor = Color(0xFFFF4C7C);
const Color decryptedTextColor = Color(0xFF00B397);
// const Color decryptedTextColor = Color(0xFF40CB68);
const Color linkColor = Color(0xFF00B397);

// main text fields small buttons
const Color smallButtonsColor = Color(0xFFF0F0F0);
const Color buttonsTitleColor = mainColor;
