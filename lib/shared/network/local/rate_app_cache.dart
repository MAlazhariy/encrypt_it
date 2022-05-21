import 'package:hive/hive.dart';

import 'operation_counter_cache.dart';

class RateCache {

  static const int _minToRate = 30;
  static const int _rateFrequency = 15;

  static Box rateBox = Hive.box('myBox');
  static bool isAppRated(){
    return rateBox.get('isRated',defaultValue: false);
  }
  static void appRatedSuccessfully({bool rated = true}){
    rateBox.put('isRated', rated);
  }
  static bool isReadyShowRate({bool inAppReview = false}){

    int counter = OperationCounterCache.getCounter();
    bool condition = inAppReview
        ? (counter == _minToRate+1) // in app review Panel rate condition
        : (counter % _rateFrequency == 5); // open google play link condition

    if(!isAppRated()){
      return (condition && counter >= _minToRate);
    } else {
      return false;
    }

  }
}