
import 'package:encryption_app/models/group_content_model.dart';

class GroupModel {
  String groupName;
  List<GroupContentModel> groupContent;

  GroupModel({
    required this.groupName,
    required this.groupContent,
  });
}