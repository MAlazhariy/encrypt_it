
import 'package:encryption_app/models/text_store_model.dart';
import 'package:encryption_app/helpers/text_store_functions.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

import 'ads/interstitial_ad_bottomsheet_model.dart';

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
    // todo: important to test this unit
    // assert(choosedGroup == null, 'choosed group can not be null when deleting a group');

    // final String deletedGroupName = choosedGroup!;
    // final Map deletedGroupValue = TextStoreCache.getGroups()![deletedGroupName];
    // final int deletedGroupIndex = TextStoreCache.getGroups()!.keys.toList().indexOf(deletedGroupName);
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
        ),
        buttons: [
          DialogButton(
            title: 'delete'.tr(),
            onPressed: () {
              Groups.deleteGroup(deletedGroupIndex);
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
                    style: const TextStyle(
                      // color: redColor,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: redColor,
                  elevation: 0,
                  action: SnackBarAction(
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    label: 'undo'.tr(),
                    onPressed: () {
                      Groups.insertGroup(
                        groupIndex: deletedGroupIndex,
                        groupModel: deletedGroup,
                      );
                      setState(() {
                        choosedGroup = deletedGroup.groupName;
                        groupIndex =
                            Groups.getGroupIndex(deletedGroup.groupName);
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
        messageTitleController: messageTitleController,
        hintText: group.groupName,
        validator: (String? value) {
          if (value?.isEmpty ?? true) {
            return 'can_not_empty'.tr();
          } else if (Groups.isGroupExists(value!)) {
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
                Groups.changeGroupName(
                  groupIndex: groupIndex!,
                  groupModel: group,
                  newName: newGroupName,
                );
                Navigator.pop(context);
                choosedGroup = newGroupName;
                groupIndex = Groups.getGroupIndex(newGroupName);
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
      Groups.deleteTitle(
        groupIndex: groupIndex!,
        titleIndex: titleIndex,
      );
    });

    // show snack bar to restore deleted title
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'title_deleted'.tr(args: [content.title]),
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        action: SnackBarAction(
          textColor: Theme.of(context).colorScheme.onPrimary,
          label: 'undo'.tr(),
          onPressed: () {
            setState(() {
              Groups.insertTitle(
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
        messageTitleController: messageTitleController,
        hintText: groups!.groups![groupIndex!].groupContent[titleIndex].title,
        validator: (value) {
          if (value!.isEmpty) {
            return 'can_not_empty'.tr();
          } else if (value.length >= 35) {
            return 'too_big_title'.tr();
          } else if (Groups.isTitleExists(
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
                Groups.editTitle(
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

  void doneAndBack() {
    Navigator.pop(context);
    AdInterstitialEditStore.showAd();
  }

  @override
  void initState() {
    super.initState();
    AdInterstitialEditStore.loadAd();
  }

  @override
  void dispose() {
    super.dispose();
    AdInterstitialEditStore.disposeAd();
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
            doneAndBack();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 15.sp,
          bottom: 5.sp,
          start: 15.sp,
          end: 15.sp,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (choosedGroup == null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          'choose_group_to_edit_text_store'.tr(),
                        ),
                      ),

                    // groups dropDown menu
                    Container(
                      decoration: BoxDecoration(
                        color: highLightColor(context),
                        borderRadius: BorderRadius.circular(15.sp),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: shadowColor(context, lightAlpha: 100),
                            offset: const Offset(0, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 6.sp,
                        horizontal: 13.sp,
                      ),
                      child: DropdownButton<String>(
                        value: choosedGroup,
                        borderRadius: BorderRadius.circular(15),
                        hint: Text(
                          'choose_group'.tr(),
                          style: TextStyle(
                              color: titlesColor(context),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo'),
                        ),
                        alignment: AlignmentDirectional.centerStart,
                        // fill the parent width
                        isExpanded: true,
                        focusColor: mainColor,
                        underline: Container(),
                        enableFeedback: true,
                        style: TextStyle(
                            color: titlesColor(context),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                        ),
                        autofocus: true,
                        menuMaxHeight: 70.h,
                        dropdownColor: highLightColor(context, darkAlpha: 255),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: titlesColor(context),
                          size: 20.sp,
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
                                ? groupIndex = Groups.getGroupIndex(value)
                                : groupIndex = null;
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10.sp,
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
                              shadowColor: shadowColor(context, lightAlpha: 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  editChoosedGroupName();
                                },
                                splashColor: smallButtonsContentColor(context).withAlpha(50),
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
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.sp,
                                      ),
                                      Icon(
                                        MyIcons.edit,
                                        color: titlesColor(context),
                                        size: 14.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // delete the group
                            Card(
                              color: highLightColor(context),
                              // color: Theme.of(context).brightness == Brightness.dark
                              //     ? Theme.of(context).errorColor
                              //     : Colors.white,
                              elevation: 5,
                              shadowColor: shadowColor(context, lightAlpha: 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  deleteChoosedGroup();
                                },
                                splashColor: smallButtonsContentColor(context).withAlpha(50),
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'delete_the_group'.tr(),
                                        style: TextStyle(
                                          color: Theme.of(context).errorColor,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.sp,
                                      ),
                                      Icon(
                                        MyIcons.delete,
                                        size: 14.sp,
                                        color: Theme.of(context).errorColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    if (choosedGroup != null)
                      const SizedBox(height: 10),

                    if (choosedGroup != null)
                      const Divider(),

                    if (choosedGroup != null)
                      const SizedBox(height: 12),

                    /// Content Titles
                    if (choosedGroup != null)
                      ListView.builder(
                        itemBuilder: (context, titleIndex) {
                          final GroupContentModel contentModel = groups!
                              .groups![Groups.getGroupIndex(choosedGroup!)]
                              .groupContent[titleIndex];

                          return Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsetsDirectional.only(
                              start: 15.sp,
                              end: 10.sp,
                              top: 5.sp,
                              bottom: 5.sp,
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
                                    alignment:
                                        AlignmentDirectional.centerStart,
                                    child: Text(
                                      contentModel.title,
                                      style: TextStyle(
                                        color: titlesColor(context),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),

                                /// delete button
                                Material(
                                  shape: const CircleBorder(),
                                  child: IconButton(
                                    onPressed: () {
                                      final bool isLastTitleInGroup = groups!
                                              .groups![groupIndex!]
                                              .groupContent
                                              .length == 1;

                                      if (isLastTitleInGroup) {
                                        deleteChoosedGroup();
                                      } else {
                                        deleteTitle(
                                          titleIndex: titleIndex,
                                          content: contentModel,
                                        );
                                      }
                                    },
                                    icon: const Icon(
                                      MyIcons.delete,
                                      color: iconsGrayColor,
                                    ),
                                    splashRadius: 13.sp,
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
                                    icon: const Icon(
                                      MyIcons.edit,
                                      color: iconsGrayColor,
                                    ),
                                    splashRadius: 13.sp,
                                    splashColor: smallButtonsContentColor(context).withAlpha(50),
                                  ),
                                  color: highLightColor(context),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount:
                            groups!.groups![groupIndex!].groupContent.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                      ),

                    if (choosedGroup != null)
                      SizedBox(
                        height: 10.sp,
                      ),
                  ],
                ),
              ),
            ),

            /// Done
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 5.sp,
                bottom: 5.sp,
              ),
              child: MaterialButton(
                onPressed: () {
                  doneAndBack();
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
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
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
    required this.messageTitleController,
    required this.validator,
    this.hintText,
  }) : super(key: key);

  final GlobalKey<FormState> formGroupKey;
  final TextEditingController messageTitleController;
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
        controller: widget.messageTitleController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'type_a_new_name'.tr(),
          hintStyle: TextStyle(
            color: titlesColor(context).withAlpha(100),
          ),
          errorStyle: const TextStyle(
            color: redColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: titlesColor(context).withAlpha(100),
              width: 1.7,
            ),
          ),
          errorBorder: const UnderlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
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
