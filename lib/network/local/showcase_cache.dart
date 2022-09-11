
import 'package:hive/hive.dart';

class ShowCaseCache {
  static Box myBox = Hive.box('myBox');

  // main showcase
  static bool isMainShowCaseViewed(){
    return myBox.get('mainShowCase', defaultValue: false);
  }
  static void mainShowCaseViewed([bool value = true]){
    myBox.put('mainShowCase', value);
  }


  // text field buttons
  static bool isButtonsShowCaseViewed(){
    return myBox.get('buttonsShowCase', defaultValue: false);
  }
  static void buttonsShowCaseViewed([bool value = true]){
    myBox.put('buttonsShowCase', value);
  }


  // add to text store button
  static bool isAddTextStoreShowCaseViewed(){
    return myBox.get('addTextStoreShowCase', defaultValue: false);
  }
  static void addTextStoreShowCaseViewed([bool value = true]){
    myBox.put('addTextStoreShowCase', value);
  }


}