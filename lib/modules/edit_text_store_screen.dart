
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/network/local/text_store_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

class EditTextStoreScreen extends StatefulWidget {
  const EditTextStoreScreen({Key key}) : super(key: key);

  @override
  _EditTextStoreScreenState createState() => _EditTextStoreScreenState();
}


class _EditTextStoreScreenState extends State<EditTextStoreScreen> {

  Map groups = TextStoreCache.getGroups();
  String choosedGroup;

  void deleteGroup(){
    final String deletedGroupName = choosedGroup;
    final Map deletedGroupValue = TextStoreCache.getGroups()[deletedGroupName];
    final int deletedGroupIndex = TextStoreCache.getGroups().keys.toList().indexOf(deletedGroupName);

    setState(() {
      showCustomDialog(
        context: context,
        title: 'delete'.tr() + ' $deletedGroupName',
        content: Text(
          'sure_to_delete_group'.tr(args: [deletedGroupName]),
        ),
        buttons: [
          DialogButton(
            title: 'delete'.tr(),
            onPressed: (){
              TextStoreCache.deleteGroup(groupName: choosedGroup);
              Navigator.pop(context);
              setState(() {
                choosedGroup = null;
              });

              // show snack bar to restore deleted group
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'group_deleted'.tr(args: [deletedGroupName]),
                    style: const TextStyle(
                      // color: redColor,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: redColor,
                  elevation: 0,
                  action: SnackBarAction(
                    textColor: contrastColor,
                    label: 'undo'.tr(),
                    onPressed: (){
                      TextStoreCache.restoreGroup(
                        groupName: deletedGroupName,
                        groupValue: deletedGroupValue,
                        groupIndex: deletedGroupIndex,
                      );
                      setState(() {
                        choosedGroup = deletedGroupName;
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
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }

  void editGroupName(){
    TextEditingController messageTitleController = TextEditingController();
    var formGroupKey = GlobalKey<FormState>();
    final String oldGroupName = choosedGroup;

    // show dialog to get new name from dialog
    showCustomDialog(
      context: context,
      title: 'edit_group_name'.tr(),
      content: _CustomInputTextForm(
        formGroupKey: formGroupKey,
        messageTitleController: messageTitleController,
        validator: (String value){
          if(value.isEmpty){
            return 'can_not_empty'.tr();
          } else if (TextStoreCache.getGroups().containsKey(value)){
            return 'group_already_exists'.tr();
          } else if(value.length >= 30){
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
          onPressed: (){
            if(formGroupKey.currentState.validate()){
              final String newGroupName = messageTitleController.text;

              TextStoreCache.changeGroupName(
                groupName: oldGroupName,
                newName: newGroupName,
              );
              Navigator.pop(context);

              setState(() {
                choosedGroup = newGroupName;
              });
            }
          },
          isBold: true,
        ),
      ],
    );
  }

  void deleteTitle({
  @required String deletedTitle,
  @required String deletedTitleValue,
  @required int deletedIndex,
}){
    setState(() {
      TextStoreCache.deleteTitle(
        groupName: choosedGroup,
        title: deletedTitle,
      );
    });

    // show snack bar to restore deleted group
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'title_deleted'.tr(args: [deletedTitle]),
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        action: SnackBarAction(
          textColor: contrastColor,
          label: 'undo'.tr(),
          onPressed: (){
            TextStoreCache.restoreTitle(
              groupName: choosedGroup,
              deletedTitle: deletedTitle,
              deletedTitleValue: deletedTitleValue,
              index: deletedIndex,
            );
            setState(() {});
          },
        ),
      ),
    );
  }

  void editTitleName(int index){
    TextEditingController messageTitleController = TextEditingController();
    var formGroupKey = GlobalKey<FormState>();
    final String oldTitleName = TextStoreCache.getTitleFromGroup(
      groupName: choosedGroup,
      index: index,
    );

    // show dialog to get new name from dialog
    showCustomDialog(
      context: context,
      title: 'edit_title_name'.tr(),
      content: _CustomInputTextForm(
        formGroupKey: formGroupKey,
        messageTitleController: messageTitleController,
        validator: (String value){
          if(value.isEmpty){
            return 'can_not_empty'.tr();
          } else if(value.length >= 30){
            return 'too_big_title'.tr();
          } else if (TextStoreCache.getGroups()[choosedGroup].containsKey(value)){
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
          onPressed: (){
            if(formGroupKey.currentState.validate()){
              String newTitleName = messageTitleController.text;

              TextStoreCache.changeTitleName(
                groupName: choosedGroup,
                oldTitleName: oldTitleName,
                newName: newTitleName,
              );

              setState(() {
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
  Widget build(BuildContext context) {

    groups??={};
    List<String> dropdownItems = List.generate(
        TextStoreCache.getGroups().length??0,
        (index) =>  TextStoreCache.getGroupName(index),
    );



    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),

      appBar: AppBar(
        title: Text(
          'edit_text_store'.tr(),
        ),
        backgroundColor: const Color(0xFFFAFAFA),
        foregroundColor: mainColor,
        elevation: 2,
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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [

                    if(choosedGroup==null)
                      Text(
                      'choose_group_to_edit_text_store'.tr(),
                    ),

                    // groups dropDown menu
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.sp),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: lightGrayColor.withAlpha(80),
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
                        borderRadius: BorderRadius.circular(20.sp),
                        hint: Text(
                          'choose_group'.tr(),
                          style: TextStyle(
                              color: lightGrayColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo'
                          ),
                        ),
                        alignment: AlignmentDirectional.centerStart,
                        isExpanded: true, // fill the parent width
                        focusColor: mainColor,
                        underline: Container(),
                        enableFeedback: true,
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo'
                        ),
                        autofocus: true,
                        menuMaxHeight: 75.h,
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down, color: lightGrayColor, size: 20.sp,),
                        items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(child: Text(value)),
                          );
                        }).toList(),

                        onChanged: (value){
                          setState(() {
                            choosedGroup = value;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 10.sp,),

                    // show group actions
                    if(choosedGroup != null)
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Wrap(
                        children: [
                          // edit group name
                          Card(
                            color: const Color(0xFFFFFFFF),
                            elevation: 5,
                            shadowColor: lightGrayColor.withAlpha(80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            child: InkWell(
                              onTap: (){
                                editGroupName();
                              },
                              splashColor: mainColor.withAlpha(50),
                              borderRadius: BorderRadius.circular(15.sp),
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'edit_group_name'.tr(),
                                      style: TextStyle(
                                        color: darkGrayColor,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.sp,),
                                    Icon(
                                      Icons.edit,
                                      color: darkGrayColor,
                                      size: 14.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // delete the group
                          Card(
                            color: const Color(0xFFFFFFFF),
                            elevation: 5,
                            shadowColor: lightGrayColor.withAlpha(80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            child: InkWell(
                              onTap: (){
                                deleteGroup();
                              },
                              splashColor: mainColor.withAlpha(50),
                              borderRadius: BorderRadius.circular(15.sp),
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'delete_the_group'.tr(),
                                      style: TextStyle(
                                        color: redColor,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.sp,),
                                    Icon(
                                      Icons.delete_outline,
                                      color: redColor,
                                      size: 14.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                    ),
                      ),

                    if(choosedGroup != null)
                      SizedBox(height: 8.sp,),

                    if(choosedGroup != null)
                      const Divider(),

                    if(choosedGroup != null)
                      SizedBox(height: 10.sp,),

                    // show choosed group' titles
                    if(choosedGroup != null)
                      for (int index = 0; index < TextStoreCache.getGroups()[choosedGroup].length; index++)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.sp,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsetsDirectional.only(
                              start: 15.sp,
                              end: 10.sp,
                              top: 5.sp,
                              bottom: 5.sp,
                            ),
                            decoration: BoxDecoration(
                              color: contrastColor,
                              borderRadius: BorderRadius.circular(15.sp),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: lightGrayColor.withAlpha(80),
                                  offset: const Offset(0, 4),
                                  blurRadius: 7,
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
                                      TextStoreCache.getTitleFromGroup(
                                        groupName: choosedGroup,
                                        index: index,
                                      ),
                                      style: TextStyle(
                                        color: darkGrayColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ),
                                ),

                                /// delete title
                                Material(
                                  child: IconButton(
                                    onPressed: (){
                                      final String deletedTitle = TextStoreCache.getGroups()[choosedGroup].keys.toList()[index];
                                      final String deletedTitleValue = TextStoreCache.getGroups()[choosedGroup].values.toList()[index];
                                      final int deletedIndex = index;

                                      final bool isLastTitleInGroup = TextStoreCache.getGroups()[choosedGroup].keys.toList().length == 1;

                                      if(isLastTitleInGroup){
                                        deleteGroup();
                                      }
                                      else {
                                        deleteTitle(
                                          deletedTitle: deletedTitle,
                                          deletedTitleValue: deletedTitleValue,
                                          deletedIndex: deletedIndex,
                                        );
                                      }

                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: lightGrayColor,
                                    ),
                                    splashRadius: 13.sp,
                                    color: Colors.red,
                                    splashColor: lightGrayColor.withAlpha(80),
                                    highlightColor: lightGrayColor.withAlpha(40),
                                  ),
                                  shape: const CircleBorder(),
                                ),

                                /// edit title name
                                Material(
                                  child: IconButton(
                                    onPressed: (){
                                      editTitleName(index);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: lightGrayColor,
                                    ),
                                    splashRadius: 13.sp,
                                    color: Colors.red,
                                    splashColor: lightGrayColor.withAlpha(80),
                                    highlightColor: lightGrayColor.withAlpha(40),
                                  ),
                                  shape: const CircleBorder(),
                                ),
                              ],
                            ),
                          ),
                        ),

                    if(choosedGroup != null)
                      SizedBox(height: 10.sp,),

                  ],
                ),
              ),
            ),
            // Done button
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 5.sp,
              ),
              child: MaterialButton(
                child: Text(
                  'done'.tr(),
                  style: TextStyle(
                    color: contrastColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                color: mainColor,
                minWidth: 70.w,
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                splashColor: contrastColor.withAlpha(25),
                highlightColor: contrastColor.withAlpha(10),
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
    Key key,
    @required this.formGroupKey,
    @required this.messageTitleController,
    @required this.validator,
  }) : super(key: key);

  final GlobalKey<FormState> formGroupKey;
  final TextEditingController messageTitleController;
  final FormFieldValidator<String> validator;

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
          hintText: 'type_a_new_name'.tr(),
          hintStyle: const TextStyle(
            color: lightGrayColor,
          ),
          errorStyle: const TextStyle(
            color: redColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(
              color: lightGrayColor,
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
        onChanged: (value){
          if(widget.formGroupKey.currentState.validate()){
          }
        },
        textAlign: TextAlign.center,
        validator: widget.validator,
      ),
    );
  }
}
