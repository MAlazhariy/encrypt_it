import 'package:hive/hive.dart';

/*
box = {'key' : 'value'};
key = groups .. refers to the groups we want to save in local
value = the groups and messages

- An example:
-------------
  'groups' : {

    'group_one' : {
        'title_one': 'encrypted message one',
        'title_two': 'encrypted message two',
        'title_three': 'encrypted message three',
        },

     'group_two' : {
        'title_one': 'encrypted message one',
        'title_two': 'encrypted message two'
        },

  }
-------------
myBox > groups > group > message title > encrypted message
*/


/// Hive can not save arabic Strings as a main key,
/// so I had to store groups inside the main key [groups].

class TextStoreCache{
  static final Box _box = Hive.box('myBox');


  static Map? getGroups(){
    return _box.get('myBox',defaultValue: {})['groups'];
  }

  static void setGroups(Map groups){
    _box.put('myBox', {'groups':groups});
  }

}



