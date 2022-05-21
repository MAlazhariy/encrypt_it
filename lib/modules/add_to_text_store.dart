// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/modules/ads/interstitial_ad_textstore_model.dart';
import 'package:encryption_app/cubit/add_to_store_cubit/store_cubit.dart';
import 'package:encryption_app/cubit/add_to_store_cubit/store_states.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:encryption_app/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:encryption_app/shared/components/components/custom_toast.dart';
import 'package:encryption_app/shared/network/local/text_store_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AddToTextStore{

  void add(BuildContext context, String encryptedMessage){

    AdInterstitial.loadInterstitialAd();

    showCustomDialog(
      context: context,
      title: 'add_to_storage'.tr(),
      content: ContentDesign(encryptedText: encryptedMessage),
    );

  }
}

class ContentDesign extends StatelessWidget {
  ContentDesign({Key key, @required this.encryptedText}) : super(key: key);

  final String encryptedText;
  Map storeGroups = TextStoreCache.getGroups();


  var titleCtrl = TextEditingController();
  var groupCtrl = TextEditingController();

  final TextStyle _infoStyle = TextStyle(
    overflow: TextOverflow.ellipsis,
    fontSize: 8.sp,
    color: lightGrayColor,
    fontWeight: FontWeight.normal,
  );


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocConsumer<StoreCubit, StoreStates>(
        listener: (BuildContext context, state){},
        builder: (BuildContext context, state){

          StoreCubit cubit = StoreCubit.get(context);
          storeGroups??={};

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: SizedBox(
                  // width: 50.w,
                  child: Text(
                    'choose_or_add_group'.tr(),
                    style: const TextStyle(
                      color: darkGrayColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),

              /// group
              Container(
                decoration: BoxDecoration(
                  color: mainColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 10.sp,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // choose group
                    GroupDropDown(cubit: cubit, groupCtrl: groupCtrl,),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        storeGroups.isNotEmpty
                            ? Text('or'.tr() + ' ')
                            : Container(),

                        Expanded(
                          child: GroupTextForm(
                            groupFormKey: cubit.groupFormKey,
                            groupCtrl: groupCtrl,
                            cubit: cubit,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),

              /// next button
              !cubit.isGroupCompleted && cubit.groupName.isNotEmpty
                  ? DialogButton(
                title: 'next'.tr(),
                isBold: true,
                onPressed: (){
                  if(cubit.groupFormKey.currentState.validate()) cubit.setCompleteGroup();
                },
              )
                  : Container(),

              /// title
              if(cubit.isGroupCompleted)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'type_the_title'.tr() + '',
                    style: const TextStyle(
                      color: darkGrayColor,
                    ),
                  ),
                ),

              if(cubit.isGroupCompleted)
                Container(
                  decoration: BoxDecoration(
                    color: mainColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.sp,
                    vertical: 10.sp,
                  ),
                  child: TitleTextForm(
                    titleCtrl: titleCtrl,
                    cubit: cubit,
                  ),
                ),

              const Divider(),

              /// details
              // cipher text
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: SizedBox(
                  width: 50.w,
                  child: Text(
                    'encrypted text'.tr() + ': ' + encryptedText,
                    style: _infoStyle,
                  ),
                ),
              ),

              // group name
              if(cubit.groupName.isNotEmpty)
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: SizedBox(
                    width: 50.w,
                    child: Text(
                      'the_group'.tr() + ': ${cubit.groupName}',
                      style: _infoStyle,
                    ),
                  ),
                ),

              // title
              if(cubit.title.isNotEmpty && cubit.isGroupCompleted)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    width: 50.w,
                    child: Text(
                      'the_title'.tr() + ': ${cubit.title}',
                      style: _infoStyle,
                    ),
                  ),
                ),

              SizedBox(height: 3.h,),

              /// buttons
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Wrap(
                    spacing: 4.sp,
                    alignment: WrapAlignment.center,
                    children: [
                      // back
                      DialogButton(
                        title: 'back'.tr(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                      // done
                      if(cubit.isGroupCompleted)
                        DialogButton(
                          title: 'done'.tr(),
                          isBold: true,
                          onPressed: () {
                            if(cubit.titleFormKey.currentState.validate() && cubit.groupFormKey.currentState.validate()){
                              onSuccessfulAdd(
                                  context: context,
                                  textTitle: titleCtrl.text,
                                  groupName: cubit.groupName,
                                  messageResult: encryptedText,
                                  cubit: cubit
                              );
                            }
                          },
                        ),

                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}


class GroupDropDown extends StatelessWidget {
  GroupDropDown({
    Key key,
    @required this.cubit,
    @required this.groupCtrl,
  }) : super(key: key);

  final StoreCubit cubit;
  final TextEditingController groupCtrl;
  Map storeGroups = TextStoreCache.getGroups();

  @override
  Widget build(BuildContext context) {
    String group = cubit.choosedGroup;

    if(storeGroups == null){
      return Container();
    }

    List<String> dropdownItems = List.generate(
        storeGroups.keys.length ??0,
            (index) {
          final String groupName = storeGroups.keys.toList()[index];
          return groupName;
        });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 3.sp,
        horizontal: 13.sp,
      ),
      child: DropdownButton<String>(
        value: group,
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
          cubit.changeChoosedGroup(value);
          cubit.setGroupName(value);
          groupCtrl.text = '';
          cubit.groupFormKey.currentState.validate();
        },
      ),
    );
  }

}
class GroupTextForm extends StatelessWidget {
  GroupTextForm({
    Key key,
    @required this.groupFormKey,
    @required this.groupCtrl,
    @required this.cubit,
  }) : super(key: key);

  final GlobalKey<FormState> groupFormKey;
  final TextEditingController groupCtrl;
  final StoreCubit cubit;
  final Map storeGroup = TextStoreCache.getGroups();

  @override
  Widget build(BuildContext context) {
    final bool _enabled = !cubit.isGroupChoosedFromDropMenu;

    return Form(
      key: groupFormKey,
      child: TextFormField(
        controller: groupCtrl,
        decoration: InputDecoration(
          hintText: 'add_new_group'.tr(),
          prefixIcon: const Icon(Icons.add),
          border: InputBorder.none,
          errorBorder: const UnderlineInputBorder(),
          errorStyle: const TextStyle(
            color: redColor,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(
              color: redColor,
              width: 1.7,
            ),
          ),
        ),
        onTap: (){
          cubit.changeIsGroupChoosedFromMenu(false);
          cubit.setGroupName(groupCtrl.text);
        },
        onChanged: (value){
          bool _ = groupFormKey.currentState.validate();

          // if(groupFormKey.currentState.validate())
          cubit.setGroupName(value);
        },
        readOnly: !_enabled,
        textAlign: TextAlign.start,
        validator: (String value){
          if(cubit.groupName.isEmpty && value.isEmpty){
            return 'must_choose_group'.tr();
          } else if(storeGroup == null){
            return null;
          } else if (storeGroup.containsKey(value)){
            // return 'group_already_exists'.tr();
            return null;
          } else if (value.length >= 30 && !cubit.isGroupChoosedFromDropMenu){
            return 'too_big_title'.tr();
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class TitleTextForm extends StatelessWidget {
  TitleTextForm({Key key, @required this.titleCtrl, @required this.cubit,}) : super(key: key);

  final TextEditingController titleCtrl;
  final StoreCubit cubit;
  final Map storeGroup = TextStoreCache.getGroups();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.titleFormKey,
      child: TextFormField(
        controller: titleCtrl,
        decoration: InputDecoration(
          hintText: 'enter_title_here'.tr(),
          border: InputBorder.none,
          errorStyle: const TextStyle(
            color: redColor,
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
        autofocus: true,
        onChanged: (value){
          if(cubit.titleFormKey.currentState.validate()){
            cubit.setTitle(value);
          }
        },
        textAlign: TextAlign.center,
        validator: (String value){
          if(value.isEmpty){
            return 'can_not_empty'.tr();
          } else if(value.length >= 30){
            return 'too_big_title'.tr();
          } else if(storeGroup == null){
            return null;
          } else if (storeGroup[cubit.groupName] == null){
            return null;
          } else if (storeGroup[cubit.groupName].containsKey(value)){
            return 'title_already_exists'.tr();
          }

          return null;
        },
      ),
    );
  }
}


void onSuccessfulAdd({
  @required BuildContext context,
  @required String textTitle,
  @required String groupName,
  @required String messageResult,
  @required StoreCubit cubit,
}){
  TextStoreCache.addTextToGroup(
    title: textTitle,
    group: groupName,
    encryptedText: messageResult,
  );

  showToast(
    title: 'added_successfully'.tr(),
    textColor: mainColor,
    contentFillColor: contrastColor,
    mSeconds: 3000,
  );

  Navigator.pop(context);

  AdInterstitial.showAd();
}