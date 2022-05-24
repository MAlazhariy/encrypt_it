import 'package:encryption_app/models/text_store_model.dart';
import 'package:encryption_app/shared/components/constants.dart';

class Groups {
  static bool isGroupExists(String groupName) {
    return groups?.toMap()?.keys.contains(groupName) ?? false;
  }

  static bool isTitleExists({
    required String title,
    required int groupIndex,
}) {
    return groups!.groups![groupIndex].groupContent.where((e) => e.title == title).isNotEmpty;
  }

  static int getGroupIndex(String groupName) {
    return groups!.groups!
        .indexWhere((element) => element.groupName == groupName);
  }

  static void addToExistGroup({
    required String groupName,
    required GroupContentModel groupModel,
  }) {
    groups!.groups![getGroupIndex(groupName)].groupContent.add(groupModel);
  }

  static void addGroup({
    required String groupName,
    required GroupContentModel groupModel,
  }) {
    groups!.groups!.add(
      GroupModel(
        groupName: groupName,
        groupContent: [groupModel],
      ),
    );
  }

  static void addTextToGroup({
    required String groupName,
    required GroupContentModel groupModel,
  }) {
    if (isGroupExists(groupName)) {
      addToExistGroup(
        groupName: groupName,
        groupModel: groupModel,
      );
    } else {
      addGroup(
        groupName: groupName,
        groupModel: groupModel,
      );
    }
  }

  static void deleteGroup(int groupIndex) {
    groups!.groups!.removeAt(groupIndex);
  }

  static void insertGroup({
    required int groupIndex,
    required GroupModel groupModel,
  }) {
    groups!.groups!.insert(groupIndex, groupModel);
  }

  static void changeGroupName({
    required int groupIndex,
    required GroupModel groupModel,
    required String newName,
  }) {
    groups!.groups![groupIndex].groupName = newName;
  }

  static void deleteTitle({
    required int groupIndex,
    required int titleIndex,
  }) {
    groups!.groups![groupIndex].groupContent.removeAt(titleIndex);
  }

  static void insertTitle({
    required int groupIndex,
    required int titleIndex,
    required GroupContentModel content,
  }) {
    groups!.groups![groupIndex].groupContent.insert(titleIndex, content);
  }

  static void editTitle({
    required int groupIndex,
    required int titleIndex,
    required String newTitle,
  }) {
    groups!.groups![groupIndex].groupContent[titleIndex].title = newTitle;
  }

}
