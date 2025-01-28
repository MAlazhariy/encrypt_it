import 'dart:developer';

import 'package:encryption_app/models/group_content_model.dart';
import 'package:encryption_app/models/group_model.dart';
import 'package:encryption_app/utils/helpers/text_store_helper.dart';
import 'package:encryption_app/view/widgets/custom_dialog/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:encryption_app/view/widgets/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';


class EditTextStoreScreen extends StatefulWidget {
  const EditTextStoreScreen({Key? key}) : super(key: key);

  @override
  EditTextStoreScreenState createState() => EditTextStoreScreenState();
}

class EditTextStoreScreenState extends State<EditTextStoreScreen> {
  String? choosedGroup;
  int? groupIndex;

  // todo: test this entire widget

  void deleteChoosedGroup() {
    final deletedGroupIndex = groupIndex!;
    final deletedGroup = groups!.groups![deletedGroupIndex];

    setState(() {
      showCustomDialog(
        context: context,
        title: '${'delete'.tr()} ${deletedGroup.groupName}',
        content: Text(
          'sure_to_delete_group'.tr(
            args: [deletedGroup.groupName],
          ),
          style: TextStyle(
            fontSize: 12+5,
          ),
        ),
        buttons: [
          DialogButton(
            title: 'delete'.tr(),
            onPressed: () {
              StoreHelper.deleteGroup(deletedGroupIndex);
              Navigator.pop(context);
              setState(() {
                groupIndex = null;
                choosedGroup = null;
              });

              // show snack bar to restore deleted group
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'group_deleted'.tr(args: [deletedGroup.groupName]),
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      fontWeight: FontWeight.normal,
                      fontSize: 12+5,
                    ),
                  ),
                  backgroundColor: redColor,
                  elevation: 0,
                  action: SnackBarAction(
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    label: 'undo'.tr(),
                    onPressed: () {
                      StoreHelper.insertGroup(
                        groupIndex: deletedGroupIndex,
                        groupModel: deletedGroup,
                      );
                      setState(() {
                        choosedGroup = deletedGroup.groupName;
                        groupIndex = deletedGroupIndex;
                      });
                    },
                  ),
                  duration: const Duration(
                    seconds: 5,
                  ),
                ),
              );
            },
            color: redColor,
          ),
          DialogButton(
            title: 'back'.tr(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }

  void editChoosedGroupName() {
    TextEditingController messageTitleController = TextEditingController();
    var formGroupKey = GlobalKey<FormState>();

    final GroupModel group = groups!.groups![groupIndex!];

    // show dialog to get new name from dialog
    showCustomDialog(
      context: context,
      title: 'edit_group_name'.tr(),
      content: _CustomInputTextForm(
        formGroupKey: formGroupKey,
        titleController: messageTitleController,
        hintText: group.groupName,
        validator: (String? value) {
          if (value?.isEmpty ?? true) {
            return 'can_not_empty'.tr();
          } else if (StoreHelper.isGroupExists(value!)) {
            return 'group_already_exists'.tr();
          } else if (value.length >= 35) {
            return 'too_big_title'.tr();
          }

          return null;
        },
      ),
      buttons: [
        /// back
        DialogButton(
          title: 'back'.tr(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        /// done
        DialogButton(
          title: 'done'.tr(),
          onPressed: () {
            if (formGroupKey.currentState!.validate()) {
              final newGroupName = messageTitleController.text;

              setState(() {
                StoreHelper.changeGroupName(
                  groupIndex: groupIndex!,
                  newName: newGroupName,
                );
                Navigator.pop(context);
                choosedGroup = newGroupName;
                groupIndex = StoreHelper.getGroupIndex(newGroupName);
              });
            }
          },
          isBold: true,
        ),
      ],
    );
  }

  void deleteTitle({
    required GroupContentModel content,
    required int titleIndex,
  }) {
    setState(() {
      /// delete from model then save changes to local db
      StoreHelper.deleteTitle(
        groupIndex: groupIndex!,
        titleIndex: titleIndex,
      );
    });

    /// show snack bar to restore deleted title
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'title_deleted'.tr(args: [content.title]),
          style: TextStyle(
            fontFamily: 'Baloo',
            fontWeight: FontWeight.normal,
            fontSize: 12+5,
          ),
        ),
        elevation: 0,
        action: SnackBarAction(
          textColor: Theme.of(context).colorScheme.onPrimary,
          label: 'undo'.tr(),
          onPressed: () {
            setState(() {
              StoreHelper.insertTitle(
                groupIndex: groupIndex!,
                titleIndex: titleIndex,
                content: content,
              );
            });
          },
        ),
      ),
    );
  }

  void editTitleName(int titleIndex) {
    TextEditingController messageTitleController = TextEditingController();
    var formGroupKey = GlobalKey<FormState>();

    // show dialog to get new name from dialog
    showCustomDialog(
      context: context,
      title: 'edit_title_name'.tr(),
      content: _CustomInputTextForm(
        formGroupKey: formGroupKey,
        titleController: messageTitleController,
        hintText: groups!.groups![groupIndex!].groupContent[titleIndex].title,
        validator: (value) {
          if (value!.isEmpty) {
            return 'can_not_empty'.tr();
          } else if (value.length >= 35) {
            return 'too_big_title'.tr();
          } else if (StoreHelper.isTitleExists(
              title: value, groupIndex: groupIndex!)) {
            return 'title_already_exists'.tr();
          }

          return null;
        },
      ),
      buttons: [
        /// back
        DialogButton(
          title: 'back'.tr(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        /// done
        DialogButton(
          title: 'done'.tr(),
          onPressed: () {
            if (formGroupKey.currentState!.validate()) {
              setState(() {
                StoreHelper.editTitle(
                  groupIndex: groupIndex!,
                  titleIndex: titleIndex,
                  newTitle: messageTitleController.text,
                );
                Navigator.pop(context);
              });
            }
          },
          isBold: true,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = List.generate(
      groups?.groups?.length ?? 0,
      (groupIndex) => groups!.groups![groupIndex].groupName,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'edit_text_store'.tr(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: smallButtonsContentColor(context),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 15+5,
          bottom: 5+5,
          start: 15+5,
          end: 15+5,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // if (choosedGroup == null)
                    //   Padding(
                    //     padding: const EdgeInsets.only(bottom: 15),
                    //     child: Text(
                    //       'choose_group_to_edit_text_store'.tr(),
                    //       style: TextStyle(
                    //         fontSize: 12+5,
                    //       ),
                    //     ),
                    //   ),

                    // groups dropDown menu
                    Container(
                      decoration: BoxDecoration(
                        color: highLightColor(context),
                        borderRadius: BorderRadius.circular(15+5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: shadowColor(context, lightAlpha: 100),
                            offset: const Offset(0, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 6+5,
                        horizontal: 13+5,
                      ),
                      child: DropdownButton<String>(
                        value: choosedGroup,
                        borderRadius: BorderRadius.circular(15),
                        hint: Text(
                          'choose_group'.tr(),
                          style: TextStyle(
                            color: titlesColor(context),
                            fontSize: 12+5,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Baloo',
                          ),
                        ),
                        alignment: AlignmentDirectional.centerStart,
                        // fill the parent width
                        isExpanded: true,
                        focusColor: mainColor,
                        underline: Container(),
                        enableFeedback: true,
                        style: TextStyle(
                          color: titlesColor(context),
                          fontSize: 12+5,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Baloo',
                        ),
                        autofocus: true,
                        menuMaxHeight: 70.h,
                        itemHeight: 22+5 >= kMinInteractiveDimension // 48
                            ? 22+5
                            : 48,
                        dropdownColor: highLightColor(context, darkAlpha: 255),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: titlesColor(context),
                          size: 20+5,
                        ),
                        items: dropdownItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(child: Text(value)),
                          );
                        }).toList(),

                        onChanged: (value) {
                          setState(() {
                            choosedGroup = value;

                            value != null
                                ? groupIndex = StoreHelper.getGroupIndex(value)
                                : groupIndex = null;
                            log('choosedGroup: $choosedGroup');
                            log('groupIndex: $groupIndex');
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10+5,
                    ),

                    // group actions
                    if (choosedGroup != null)
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Wrap(
                          children: [
                            // edit group name
                            Card(
                              color: highLightColor(context),
                              elevation: 5,
                              shadowColor:
                                  shadowColor(context, lightAlpha: 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  editChoosedGroupName();
                                },
                                splashColor: smallButtonsContentColor(context)
                                    .withAlpha(50),
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'edit_group_name'.tr(),
                                        style: TextStyle(
                                          color: titlesColor(context),
                                          fontSize: 10+5,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5+5,
                                      ),
                                      Icon(
                                        MyIcons.edit,
                                        color: titlesColor(context),
                                        size: 14+5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // delete the group
                            Card(
                              color: highLightColor(context),
                              elevation: 5,
                              shadowColor:
                                  shadowColor(context, lightAlpha: 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  deleteChoosedGroup();
                                },
                                splashColor: smallButtonsContentColor(context)
                                    .withAlpha(50),
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'delete_the_group'.tr(),
                                        style: TextStyle(
                                          color: titlesColor(context),
                                          fontSize: 10+5,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5+5,
                                      ),
                                      Icon(
                                        MyIcons.delete,
                                        size: 14+5,
                                        color: titlesColor(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    if (choosedGroup != null) const SizedBox(height: 10),

                    if (choosedGroup != null) const Divider(),

                    if (choosedGroup != null) const SizedBox(height: 12),

                    /// Content Titles
                    if (choosedGroup != null && groupIndex != null)
                      ListView.builder(
                        itemCount:
                            groups!.groups![groupIndex!].groupContent.length,
                        itemBuilder: (context, titleIndex) {
                          final contentModel = groups!
                              .groups![groupIndex!].groupContent[titleIndex];

                          return _TitleBuilder(
                            deleteChoosedGroup: deleteChoosedGroup,
                            deleteTitle: deleteTitle,
                            editTitleName: editTitleName,
                            groupIndex: groupIndex,
                            contentModel: contentModel,
                            titleIndex: titleIndex,
                          );
                        },
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                      ),

                    if (choosedGroup != null)
                      SizedBox(
                        height: 10+5,
                      ),
                  ],
                ),
              ),
            ),

            /// Done
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 5+5,
                bottom: 5+5,
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: smallButtonsContentColor(context),
                minWidth: 50.w,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                splashColor: Colors.white.withAlpha(25),
                highlightColor: Colors.white.withAlpha(10),
                child: Text(
                  'done'.tr(),
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 12+5,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomInputTextForm extends StatefulWidget {
  const _CustomInputTextForm({
    Key? key,
    required this.formGroupKey,
    required this.titleController,
    required this.validator,
    this.hintText,
  }) : super(key: key);

  final GlobalKey<FormState> formGroupKey;
  final TextEditingController titleController;
  final FormFieldValidator<String> validator;
  final String? hintText;

  @override
  State<_CustomInputTextForm> createState() => _CustomInputTextFormState();
}

class _CustomInputTextFormState extends State<_CustomInputTextForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formGroupKey,
      child: TextFormField(
        controller: widget.titleController,
        style: TextStyle(
          fontSize: 12+5,
        ),
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'type_a_new_name'.tr(),
          hintStyle: TextStyle(
            color: titlesColor(context).withAlpha(100),
            fontSize: 12+5,
          ),
          errorStyle: TextStyle(
            color: redColor,
            fontSize: 10+5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10+5),
            borderSide: BorderSide(
              color: titlesColor(context).withAlpha(100),
              width: 1.7,
            ),
          ),
          errorBorder: const UnderlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10+5),
            borderSide: const BorderSide(
              color: redColor,
              width: 1.7,
            ),
          ),
        ),
        onChanged: (value) {
          if (widget.formGroupKey.currentState!.validate()) {}
        },
        textAlign: TextAlign.center,
        validator: widget.validator,
      ),
    );
  }
}

class _TitleBuilder extends StatelessWidget {
  const _TitleBuilder({
    Key? key,
    required this.deleteChoosedGroup,
    required this.deleteTitle,
    required this.editTitleName,
    required this.groupIndex,
    required this.contentModel,
    required this.titleIndex,
  }) : super(key: key);

  final Function deleteChoosedGroup;
  final Function({
    required GroupContentModel content,
    required int titleIndex,
  }) deleteTitle;
  final Function(int titleIndex) editTitleName;
  final int? groupIndex;
  final GroupContentModel contentModel;
  final int titleIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsetsDirectional.only(
        start: 15+5,
        end: 10+5,
        top: 5+5,
        bottom: 5+5,
      ),
      decoration: BoxDecoration(
        color: highLightColor(context, darkAlpha: 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor(context, lightAlpha: 100),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                contentModel.title,
                style: TextStyle(
                  color: titlesColor(context),
                  fontSize: 12+5,
                ),
              ),
            ),
          ),

          /// delete button
          Material(
            shape: const CircleBorder(),
            child: IconButton(
              onPressed: () {
                final bool isLastTitleInGroup =
                    groups!.groups![groupIndex!].groupContent.length == 1;

                if (isLastTitleInGroup) {
                  deleteChoosedGroup();
                } else {
                  deleteTitle(
                    titleIndex: titleIndex,
                    content: contentModel,
                  );
                }
              },
              icon: Icon(
                MyIcons.delete,
                color: iconsGrayColor,
                size: 13+5,
              ),
              splashRadius: 13+5,
            ),
            color: highLightColor(context),
          ),

          /// edit title name
          Material(
            shape: const CircleBorder(),
            child: IconButton(
              onPressed: () {
                editTitleName(titleIndex);
              },
              icon: Icon(
                MyIcons.edit,
                color: iconsGrayColor,
                size: 13+5,
              ),
              splashRadius: 13+5,
              splashColor: smallButtonsContentColor(context).withAlpha(50),
            ),
            color: highLightColor(context),
          ),
        ],
      ),
    );
  }
}
