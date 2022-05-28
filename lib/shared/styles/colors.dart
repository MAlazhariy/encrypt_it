import 'package:flutter/material.dart';

Color highLightColor(BuildContext context, {int darkAlpha = 217}) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return const Color(0xFF454649).withAlpha(darkAlpha);
  }
  return Colors.white;
}

Color shadowColor(BuildContext context, {int lightAlpha = 135}) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return Theme.of(context).shadowColor;
  }
  return Theme.of(context).shadowColor.withAlpha(lightAlpha);
}

Color smallButtonsContentColor(BuildContext context) {
  // colored small buttons
  // & text store group titles
  // & drawer icon
  // & textSpan
  // & appBar title
  // & done button in edit screen
  if (Theme.of(context).brightness == Brightness.dark) {
    return const Color(0xFFECF0F3);
  }
  return mainColor;
}

Color dialogButtonColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return const Color(0xFFECF0F3);
  }
  return mainColor;
}

Color titlesColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return const Color(0xFFC8C8CC);
  }
  return const Color(0xFF595a5d);
}

const Color iconsGrayColor = Color(0xFF98989a);

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
