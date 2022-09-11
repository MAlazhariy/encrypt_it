import 'package:encryption_app/models/group_content_model.dart';
import 'package:encryption_app/models/group_model.dart';

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

  StoreModel(List<GroupModel> groupModels) {
    groups = groupModels;
  }

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