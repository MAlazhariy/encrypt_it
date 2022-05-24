/*
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
*/

/// var map1 = Map.fromIterable(list, key: (e) => e.name, value: (e) => e.age);

class StoreModel {
  List<StoreGroupModel>? groups;

  // groups[0].groupName
  // groupModel.groupName .. group name
  // groupModel.group .. group content
  // groupModel.group.title .. group content title
  // groupModel.group.ciphertext .. group content ciphertext

  StoreModel.fromJson(Map? json) {
    if (json != null) {
      groups = List.generate(
        json.length,
            (i) =>
            StoreGroupModel(
              groupName: json.keys.toList()[i],
              group: List.generate(
                json.values.toList()[i].keys
                    .toList()
                    .length,
                    (index) =>
                    GroupModel(
                      title: json.values.toList()[i].keys.toList()[index],
                      ciphertext: json.values.toList()[i].values
                          .toList()[index],
                    ),
              ),
            ),
      );

      // for (int i = 0; i < jsonGroups.length; i++) {
      //   groups!.add(
      //     StoreGroupModel(
      //       groupName: jsonGroups.keys.toList()[i],
      //       group: List.generate(
      //         jsonGroups.values.toList()[i].keys.toList().length,
      //         (index) => GroupModel(
      //           title: jsonGroups.values.toList()[i].keys.toList()[index],
      //           ciphertext:
      //               jsonGroups.values.toList()[i].values.toList()[index],
      //         ),
      //       ),
      //     ),
      //   );
      // }
    }
  }

  Map<String, Map> toMap() {
    return Map.fromIterable(
      groups!,
      key: (e) {
        return e.groupName;
      },
      value: (e) {
        return Map.fromIterable(
          e.group,
          key: (x) => x.title,
          value: (x) => x.ciphertext,
        );
      },
    );
  }
}

class StoreGroupModel {
  String groupName;
  List<GroupModel> group;

  StoreGroupModel({
    required this.groupName,
    required this.group,
  });
}

class GroupModel {
  String title;
  String ciphertext;

  GroupModel({
    required this.title,
    required this.ciphertext,
  });
}
