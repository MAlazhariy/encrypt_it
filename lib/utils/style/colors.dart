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
  // & about app' app name
  if (Theme.of(context).brightness == Brightness.dark) {
    return const Color(0xFFECF0F3);
  }
  return mainColor;
}

Color dialogButtonColor(BuildContext context) {
  // dialog buttons
  // & add to store text fields background
  // & toast background
  // & about app' icon logo
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

Color dropdownContainerColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return const Color(0xFF262626);
  }
  return Colors.white;
}

const Color iconsGrayColor = Color(0xFF98989a);

// 000032
// 0000ff
const darkBlueColor = Color(0xFF3A3A3C);
const mainColor = Colors.black;
final mainSwatch = MaterialColor(
  mainColor.value,
  // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: mainColor.withOpacity(0.1), //10%
    100: mainColor.withOpacity(0.2), //20%
    200: mainColor.withOpacity(0.3), //30%
    300: mainColor.withOpacity(0.4), //40%
    400: mainColor.withOpacity(0.5), //50%
    500: mainColor.withOpacity(0.6), //60%
    600: mainColor.withOpacity(0.7), //70%
    700: mainColor.withOpacity(0.8), //80%
    800: mainColor.withOpacity(0.9), //90%
    900: mainColor.withOpacity(1), //100%
  },
);

const Color redColor = Color(0xFFFF4C7C);
const Color encryptedTextColor = redColor;
const Color decryptedTextColor = Color(0xFF00B397);
// const Color decryptedTextColor = Color(0xFF40CB68);
const Color linkColor = decryptedTextColor;

// main text fields small buttons
const Color buttonsTitleColor = mainColor;
