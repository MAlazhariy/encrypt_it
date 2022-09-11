import 'package:hive/hive.dart';

class ThemeCache {

  static Box rateBox = Hive.box('myBox');

  static bool? isDarkMode(){
    return rateBox.get('isDarkMode');
  }
  static void setDarkMode(bool value){
    rateBox.put('isDarkMode', value);
  }

}