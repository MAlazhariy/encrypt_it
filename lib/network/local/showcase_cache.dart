
import 'package:hive/hive.dart';

class ShowCaseCache {
  static Box myBox = Hive.box('myBox');

  // main showcase
  static bool isMainShowCaseViewed(){
    return myBox.get('mainShowCase_05', defaultValue: false);
  }
  static void mainShowCaseViewed([bool value = true]){
    myBox.put('mainShowCase_05', value);
  }


  // text field buttons
  static bool isButtonsShowCaseViewed(){
    return myBox.get('buttonsShowCase_05', defaultValue: false);
  }
  static void buttonsShowCaseViewed([bool value = true]){
    myBox.put('buttonsShowCase_05', value);
  }


  // add to text store button
  static bool isAddTextStoreShowCaseViewed(){
    return myBox.get('addTextStoreShowCase_05', defaultValue: false);
  }
  static void addTextStoreShowCaseViewed([bool value = true]){
    myBox.put('addTextStoreShowCase_05', value);
  }


}