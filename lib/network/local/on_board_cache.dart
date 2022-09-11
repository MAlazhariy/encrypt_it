import 'package:hive/hive.dart';

class BoardCache {
  static Box boardBox = Hive.box('myBox');

  static bool isBoardSkipped(){
    return boardBox.get('isBoardOpened', defaultValue: false);
  }
  static void boardHasOpened(){
    boardBox.put('isBoardOpened', true);
  }
}