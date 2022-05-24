// ignore_for_file: prefer_for_elements_to_map_fromiterable

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
-------------
*/


class StoreModel {
  List<GroupModel>? groups;

  StoreModel.fromJson(Map? json) {
    if (json != null) {
      groups = List.generate(
        json.length,
            (i) =>
            GroupModel(
              groupName: json.keys.toList()[i],
              groupContent: List.generate(
                json.values.toList()[i].keys
                    .toList()
                    .length,
                    (index) =>
                    GroupContentModel(
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
  Map<String, Map>? toMap() {
    if(groups == null){
      return null;
    }
    return Map.fromIterable(
      groups!,
      key: (e) {
        return e.groupName;
      },
      value: (e) {
        return Map.fromIterable(
          e.groupContent,
          key: (x) => x.title,
          value: (x) => x.ciphertext,
        );
      },
    );
  }
}

class GroupModel {
  String groupName;
  List<GroupContentModel> groupContent;

  GroupModel({
    required this.groupName,
    required this.groupContent,
  });
}

class GroupContentModel {
  String title;
  String ciphertext;

  GroupContentModel({
    required this.title,
    required this.ciphertext,
  });
}
