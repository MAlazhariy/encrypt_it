
import 'package:encryption_app/models/text_store_model/group_content_model.dart';

class GroupModel {
  String groupName;
  List<GroupContentModel> groupContent;

  GroupModel({
    required this.groupName,
    required this.groupContent,
  });
}