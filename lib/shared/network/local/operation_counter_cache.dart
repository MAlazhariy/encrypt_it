import 'package:hive/hive.dart';

/// This class is responsible for counting
/// the encryption operations made in the application.
class OperationCounterCache{

  static Box box = Hive.box('myBox');
  static int getCounter(){
    return box.get('operationCounter',defaultValue: 0);
  }
  static void increaseCounter(){
    int counter = getCounter();
    counter ++;
    box.put('operationCounter', counter);
    // log('counter = $counter');
  }
  static void clearOperationCounter([int value = 0]){
    box.put('operationCounter', value);
  }

}