// ignore_for_file: unused_import

import 'package:encryption_app/helpers/text_store_helper.dart';
import 'package:encryption_app/models/text_store_model/group_content_model.dart';
import 'package:encryption_app/models/text_store_model/group_model.dart';
import 'package:encryption_app/models/text_store_model/text_store_model.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  group('text store when groups is NULL', () {
    groups = null;

    test('is group exists', () {
      groups = null;
      final isGroupExists = Groups.isGroupExists('test');
      expect(isGroupExists, false);
    });

    test('group index', () {
      groups = null;
      final groupIndex = Groups.getGroupIndex('test');
      expect(groupIndex, -1);
    });

    test('is title exists', () {
      groups = null;
      final isTitleExists = Groups.isTitleExists(
        title: 'testTitle',
        groupIndex: Groups.getGroupIndex('test'),
      );
      expect(isTitleExists, false);
    });

    test('add title to group', () {
      groups = null;

      Groups.addTitleToGroup(
        groupName: 'test',
        groupModel: GroupContentModel(
          title: 'testTitle',
          ciphertext: 'cipherText',
        ),
      );

      expect(groups != null, true);
      expect(groups!.groups!.length, 1);
      expect(groups!.groups!.first.groupName, 'test');
      expect(groups!.groups!.first.groupContent.length, 1);
      expect(groups!.groups!.first.groupContent.first.title, 'testTitle');
      expect(groups!.groups!.first.groupContent.first.ciphertext, 'cipherText');
    });
  });

  group('text store CRUD', () {
    groups = null;

    const groupName = 'test';
    final groupModel = GroupContentModel(
      title: 'testTitle',
      ciphertext: 'ciphertext',
    );

    Groups.addTitleToGroup(
      groupName: groupName,
      groupModel: groupModel,
    );

    test('is group exists', () {
      bool isGroupExists = Groups.isGroupExists(groupName);
      expect(isGroupExists, true);

      isGroupExists = Groups.isGroupExists('different group');
      expect(isGroupExists, false);
    });

    test('is title exists', () {
      bool isTitleExists = Groups.isTitleExists(
        title: groupModel.title,
        groupIndex: Groups.getGroupIndex(groupName),
      );
      expect(isTitleExists, true);

      isTitleExists = Groups.isTitleExists(
        title: groupModel.title,
        groupIndex: Groups.getGroupIndex('different group'),
      );
      expect(isTitleExists, false);
    });

    test('get group index', () {
      int groupIndex = Groups.getGroupIndex(groupName);
      expect(groupIndex, 0);

      groupIndex = Groups.getGroupIndex('different group');
      expect(groupIndex, -1);
    });

    test('add text to exists group', () {
      Groups.addTitleToGroup(
        groupName: groupName,
        groupModel: GroupContentModel(
          title: 'another title added',
          ciphertext: 'cipherText',
        ),
      );

      expect(groups!.groups!.length, 1);
      expect(groups!.groups!.first.groupContent.length, 2);
      expect(
          groups!.groups!.first.groupContent.last.title, 'another title added');

      // delete added title
      Groups.deleteTitle(
        groupIndex: Groups.getGroupIndex(groupName),
        titleIndex: groups!.groups!.first.groupContent.length - 1,
      );
    });

    test('add text to not exists group', () {
      Groups.addTitleToGroup(
        groupName: 'different group',
        groupModel: GroupContentModel(
          title: 'new title',
          ciphertext: 'cipherText',
        ),
      );

      expect(groups!.groups!.length, 2);
      expect(groups!.groups!.first.groupContent.length, 1);
      expect(groups!.groups!.last.groupContent.length, 1);
      expect(groups!.groups!.last.groupContent.last.title, 'new title');

      // delete added title
      Groups.deleteGroup(Groups.getGroupIndex('different group'));
    });

    test('insert a group to specific index then delete it', () {
      final group = GroupModel(
        groupName: 'credit cards',
        groupContent: [
          GroupContentModel(
            title: 'my visa',
            ciphertext: 'ciphertext',
          ),
        ],
      );

      expect(groups!.groups!.length, 1);

      Groups.insertGroup(
        groupIndex: 0,
        groupModel: group,
      );

      expect(groups!.groups!.length, 2);
      expect(groups!.groups!.first.groupName, group.groupName);
      expect(groups!.groups!.first.groupContent.first.title,
          group.groupContent.first.title);
      expect(groups!.groups!.last.groupName, groupName);

      Groups.deleteGroup(0);

      expect(groups!.groups!.first.groupName, groupName);
    });

    test('delete the group then restore it', () {
      final deletedGroupIndex = Groups.getGroupIndex(groupName);
      final deletedGroup = groups!.groups![deletedGroupIndex];

      expect(groups!.groups!.length, 1);

      Groups.deleteGroup(deletedGroupIndex);

      expect(groups!.groups!.length, 0);

      Groups.insertGroup(
        groupIndex: deletedGroupIndex,
        groupModel: deletedGroup,
      );

      expect(groups!.groups!.length, 1);
      expect(groups!.groups!.first.groupName, groupName);
      expect(groups!.groups!.first.groupContent.length, 1);
      expect(groups!.groups!.first.groupContent.first.title, groupModel.title);
    });

    test('add a title then delete it then restore it', () {
      expect(groups!.groups!.length, 1);

      // add a title
      Groups.addTitleToGroup(
        groupName: groupName,
        groupModel: GroupContentModel(
          title: 'title two',
          ciphertext: 'ciphertext',
        ),
      );

      expect(groups!.groups!.first.groupContent.length, 2);
      expect(groups!.groups!.first.groupContent[1].title, 'title two');

      // delete the title
      Groups.deleteTitle(
        groupIndex: Groups.getGroupIndex(groupName),
        titleIndex: 1,
      );

      expect(groups!.groups!.first.groupContent.length, 1);

      // restore the title
      Groups.insertTitle(
        groupIndex: 0,
        titleIndex: 1,
        content: GroupContentModel(
          title: 'title two',
          ciphertext: 'ciphertext',
        ),
      );
      expect(groups!.groups!.first.groupContent.length, 2);
      expect(groups!.groups!.first.groupContent[1].title, 'title two');

      // restore changes - delete the added title
      Groups.deleteTitle(
        groupIndex: 0,
        titleIndex: 1,
      );
    });

    test('edit group name', () {
      Groups.changeGroupName(
        groupIndex: 0,
        newName: 'newName',
      );
      expect(groups!.groups!.first.groupName, 'newName');

      // restore changes
      Groups.changeGroupName(
        groupIndex: 0,
        newName: groupName,
      );
    });

    test('edit title name', () {
      Groups.editTitle(
        groupIndex: 0,
        titleIndex: 0,
        newTitle: 'newTitle',
      );

      expect(groups!.groups!.first.groupContent.first.title, 'newTitle');

      // restore changes
      Groups.editTitle(
        groupIndex: 0,
        titleIndex: 0,
        newTitle: 'testTitle',
      );

      expect(groups!.groups!.first.groupContent.first.title, 'testTitle');
    });
  });

}
