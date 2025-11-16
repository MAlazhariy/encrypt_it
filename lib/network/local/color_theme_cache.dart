import 'package:hive/hive.dart';

class ThemeCache {
  static Box rateBox = Hive.box('myBox');

  static bool? isDarkMode() {
    return rateBox.get('isDarkMode');
  }

  static Future<void> setDarkMode(bool value) async {
    await rateBox.put('isDarkMode', value);
  }
}
