import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/*
box = {'key' : 'value'};
key = groups .. refers to the groups we want to save in local
value = the groups and messages

- An example:
-------------
  'groups' : {

    'group one' : {
        'title one': 'encrypted message one',
        'title two': 'encrypted message two'
        },

     'group two' : {
        'title one': 'encrypted message one',
        'title two': 'encrypted message two'
        },

  }
-------------
myBox > groups > group > message title > encrypted message

- Why did I do that?
= because the Hive can not save arabic Strings as a main key,
so I had to store the group names and message titles inside the main key [myBox].
 */

class TextStoreCache{
  static final Box _box = Hive.box('myBox');


  static Map getGroups(){
    return _box.get('myBox',defaultValue: {})['groups'];
  }

  static String getGroupName(int index){
    return getGroups().keys.toList()[index];
  }

  static String getTitleFromGroup({
    @required String groupName,
    @required int index,
}){
    return getGroups()[groupName].keys.toList()[index];
  }


  static void addTextToGroup({
    @required String group,
    @required String title,
    @required String encryptedText,
  }){

    Map myBox = _box.get('myBox',defaultValue: {});

    Map groups = myBox['groups'];
    // if groups is null give it an initial value
    groups??= {group:{}};

    if(groups.containsKey(group)){
      groups[group].addAll({title: encryptedText});
    } else {
      groups.addAll({group:{title: encryptedText}});
    }

    // now save changes to the box myBox
    _box.put('myBox', {'groups':groups});
  }


  static void deleteTitle({
    @required String groupName,
    @required String title,
}){
    Map myBox = _box.get('myBox');

    Map groups = myBox['groups'];
    groups[groupName].remove(title);

    _box.put('myBox', {'groups':groups});
  }

  static void restoreTitle({
    @required String groupName,
    @required String deletedTitle,
    @required String deletedTitleValue,
    @required int index,
  }){
    Map myBox = _box.get('myBox');

    Map groups = myBox['groups'];

    final int titlesLength = groups[groupName].keys.length +1; /* add to deleted title +1 */

    // 'groups' : {
    //
    //   'group_one' : {
    //      'title_one': 'encrypted_message_one',
    //      'title two': 'encrypted message two'
    //   },
    //
    //   'group_two' : {
    //      'title one': 'encrypted message one',
    //      'title two': 'encrypted message two'
    //   },
    //
    // }


    for(int i = index; i < titlesLength; i++){

      // first add the group again
      if(i == index){
        // add title again
        groups[groupName].addAll({deletedTitle: deletedTitleValue});
      } else {
        // get current title and value
        final String currentTitle = getGroups()[groupName].keys.toList()[index];
        final String currentValue = getGroups()[groupName].values.toList()[index];

        // remove title
        groups[groupName].remove(currentTitle);

        // add title again
        groups[groupName].addAll({currentTitle: currentValue});
      }

    }

    _box.put('myBox', {'groups':groups});
  }

  static void deleteGroup({
    @required String groupName,
  }){
    Map myBox = _box.get('myBox');

    Map groups = myBox['groups'];
    groups.remove(groupName);

    _box.put('myBox', {'groups':groups});
  }

  static void restoreGroup({
    @required String groupName,
    @required Map groupValue,
    @required int groupIndex,
  }){
    Map myBox = _box.get('myBox');

    Map groups = myBox['groups'];

    final int groupLength = groups.keys.length +1; // add to deleted group +1

    // 'groups' : {
    //
    //   'group_one' : {
    //      'title one': 'encrypted message one',
    //      'title two': 'encrypted message two'
    //   },
    //
    //   'group_two' : {
    //      'title one': 'encrypted message one',
    //      'title two': 'encrypted message two'
    //   },
    //
    // }


    for(int i = groupIndex; i < groupLength; i++){

      // first add the group again
      if(i == groupIndex){
        // add group again
        groups.addAll({groupName: groupValue});
      } else {
        // get current group name and value
        final String currentGroupName = groups.keys.toList()[groupIndex];
        final Map currentGroupValue = groups[currentGroupName];

        //remove group
        groups.remove(currentGroupName);

        // add group again
        groups.addAll({currentGroupName: currentGroupValue});
      }

    }

    _box.put('myBox', {'groups':groups});
  }


static void changeGroupName({
  @required String groupName,
  @required String newName,
}){
  Map myBox = _box.get('myBox');

  Map groups = myBox['groups'];

  // get index of group
  final int index = groups.keys.toList().indexOf(groupName);
  final int groupLength = groups.keys.length;

  // 'groups' : {
  //
  //   'group_one' : {
  //      'title one': 'encrypted message one',
  //      'title two': 'encrypted message two'
  //   },
  //
  //   'group_two' : {
  //      'title one': 'encrypted message one',
  //      'title two': 'encrypted message two'
  //   },
  //
  // }


  for(int i = index; i < groupLength; i++){

    // first remove and re-add the element in its index
    if(i == index){
      // get group value
      final Map groupValue = groups[groupName];

      // remove group
      groups.remove(groupName);

      // add again with the new name
      groups.addAll({newName: groupValue});
    } else {
      // get current group name and value
      final String currentGroupName = groups.keys.toList()[index];
      final Map currentGroupValue = groups[currentGroupName];

      //remove group
      groups.remove(currentGroupName);

      // add group again
      groups.addAll({currentGroupName: currentGroupValue});
    }

  }

  _box.put('myBox', {'groups':groups});
}

  static void changeTitleName({
    @required String groupName,
    @required String oldTitleName,
    @required String newName,
  }){
    Map myBox = _box.get('myBox');

    Map groups = myBox['groups'];

    // get index of title
    final int index = groups[groupName].keys.toList().indexOf(oldTitleName);
    final int titlesLength = groups[groupName].keys.length;


    for(int i = index; i < titlesLength; i++){

      if(i == index){
        // get title value
        final String encryptedText = groups[groupName].values.toList()[index];

        // remove title
        groups[groupName].remove(oldTitleName);

        // add again with the new name
        groups[groupName].addAll({newName: encryptedText});
      } else {
        // get current title name & value
        final String currentTitleName = groups[groupName].keys.toList()[index];
        final String currentEncryptedText = groups[groupName].values.toList()[index];

        // remove title
        groups[groupName].remove(currentTitleName);

        // add again
        groups[groupName].addAll({currentTitleName: currentEncryptedText});
      }

    }

    _box.put('myBox', {'groups':groups});
  }


}



