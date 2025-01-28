// ignore_for_file: unused_import

import 'dart:developer';
import 'package:encryption_app/models/group_content_model.dart';
import 'package:encryption_app/models/text_store_model.dart';
import 'package:encryption_app/utils/helpers/text_store_helper.dart';
import 'package:encryption_app/controllers/store_cubit/store_cubit.dart';
import 'package:encryption_app/controllers/store_cubit/store_states.dart';
import 'package:encryption_app/view/widgets/custom_dialog/dialog_button.dart';
import 'package:encryption_app/view/widgets/custom_toast.dart';
import 'package:encryption_app/utils/helpers/dismiss_keyboard.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// We do not save any private data here
/// we save only the encrypted text.
class AddToTextStoreScreen extends StatelessWidget {
  AddToTextStoreScreen({
    Key? key,
    required this.encryptedText,
  }) : super(key: key);

  final String encryptedText;

  final titleCtrl = TextEditingController();
  final groupCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextStyle _infoStyle = TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 8.5+5,
      color: titlesColor(context),
      fontWeight: FontWeight.normal,
    );

    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocConsumer<StoreCubit, StoreStates>(
        listener: (context, state) {
          if (state is StoreInitState) {
            // todo: report this bug
            log('initial state :)');
          }
        },
        builder: (context, state) {
          StoreCubit cubit = StoreCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'add_to_storage'.tr(),
              ),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  back(context);
                },
                icon: const Icon(Icons.close),
                tooltip: 'cancel'.tr(),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'choose_or_add_group'.tr(),
                              style: TextStyle(
                                color: titlesColor(context),
                                fontSize: 10+5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5+5,
                          ),

                          /// group section
                          Container(
                            decoration: BoxDecoration(
                              color: dialogButtonColor(context).withAlpha(15),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10+5,
                              vertical: 10+5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // choose a group dropDown
                                groups?.groups?.isNotEmpty ?? false
                                    ? GroupDropDown(groupCtrl: groupCtrl)
                                    : Container(),

                                groups?.groups?.isNotEmpty ?? false
                                    ? SizedBox(height: 1.h)
                                    : Container(),

                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    groups?.groups?.isNotEmpty ?? false
                                        ? Text(
                                            '${'or'.tr()} ',
                                            style: TextStyle(
                                              fontSize: 10+5,
                                            ),
                                          )
                                        : Container(),
                                    Expanded(
                                      child: GroupTextForm(
                                        groupFormKey: cubit.groupFormKey,
                                        groupCtrl: groupCtrl,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),

                          /// next button
                          if (!cubit.isGroupCompleted &&
                              cubit.groupName.isNotEmpty)
                            DialogButton(
                              title: 'next'.tr(),
                              isBold: true,
                              onPressed: () {
                                if (cubit.groupFormKey.currentState!
                                    .validate()) {
                                  cubit.setCompleteGroup();
                                }
                              },
                            ),

                          /// title section
                          if (cubit.isGroupCompleted)
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'type_the_title'.tr(),
                                style: TextStyle(
                                  color: titlesColor(context),
                                  fontSize: 10+5,
                                ),
                              ),
                            ),

                          if (cubit.isGroupCompleted)
                            Container(
                              decoration: BoxDecoration(
                                color: dialogButtonColor(context).withAlpha(15),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10+5,
                                vertical: 10+5,
                              ),
                              child: TitleTextForm(
                                titleCtrl: titleCtrl,
                              ),
                            ),

                          const Divider(),

                          /// details
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: SizedBox(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // cipher text
                                  Text(
                                    '${'encrypted text'.tr()}: $encryptedText',
                                    style: _infoStyle,
                                  ),

                                  // group name
                                  if (cubit.groupName.isNotEmpty)
                                    Text(
                                      '${'the_group'.tr()}: ${cubit.groupName}',
                                      style: _infoStyle,
                                    ),

                                  // title
                                  if (cubit.title.isNotEmpty &&
                                      cubit.isGroupCompleted)
                                    Text(
                                      '${'the_title'.tr()}: ${cubit.title}',
                                      style: _infoStyle,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// buttons
                  // back
                  if (!cubit.isGroupCompleted)
                    DialogButton(
                      title: 'back'.tr(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                  // button
                  if (cubit.isGroupCompleted)
                    MaterialButton(
                      onPressed: () {
                        if (cubit.titleFormKey.currentState!.validate() &&
                            cubit.groupFormKey.currentState!.validate()) {
                          dismissKeyboard(context);

                          onSuccessfulAdd(
                            context: context,
                            textTitle: titleCtrl.text,
                            groupName: cubit.groupName,
                            messageResult: encryptedText,
                          );
                        }
                      },
                      color: smallButtonsContentColor(context),
                      minWidth: 40.w,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      splashColor: Colors.white.withAlpha(25),
                      highlightColor: Colors.white.withAlpha(10),
                      child: Text(
                        'add'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 12+5,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GroupDropDown extends StatelessWidget {
  const GroupDropDown({
    Key? key,
    required this.groupCtrl,
  }) : super(key: key);

  final TextEditingController groupCtrl;

  @override
  Widget build(BuildContext context) {
    StoreCubit cubit = StoreCubit.get(context);
    String? group = cubit.choosedGroup;

    if (groups?.groups == null) {
      return Container();
    }

    List<String> dropdownItems = List.generate(groups?.groups?.length ?? 0,
        (groupIndex) => groups!.groups![groupIndex].groupName);

    return Container(
      decoration: BoxDecoration(
        color: dropdownContainerColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 3+5,
        horizontal: 13+5,
      ),
      child: DropdownButton<String>(
        value: group,
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
        isExpanded: true,
        itemHeight: 22+5 >= kMinInteractiveDimension // 48
            ? 22+5
            : 48,
        // fill the parent width
        // focusColor: mainColor,
        underline: Container(),
        enableFeedback: true,
        style: TextStyle(
          color: titlesColor(context),
          fontSize: 12+5,
          fontWeight: FontWeight.w500,
          fontFamily: 'Baloo',
        ),
        autofocus: true,
        menuMaxHeight: 75.h,
        dropdownColor: highLightColor(context, darkAlpha: 255),
        icon: Icon(
          Icons.arrow_drop_down,
          color: titlesColor(context),
          size: 20+5,
        ),
        items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value)),
          );
        }).toList(),

        onChanged: (value) {
          cubit.changeChoosedGroup(value!);
          cubit.setGroupName(value);
          groupCtrl.text = '';
          cubit.groupFormKey.currentState!.validate();
        },
      ),
    );
  }
}

class GroupTextForm extends StatelessWidget {
  const GroupTextForm({
    Key? key,
    required this.groupFormKey,
    required this.groupCtrl,
  }) : super(key: key);

  final GlobalKey<FormState> groupFormKey;
  final TextEditingController groupCtrl;

  @override
  Widget build(BuildContext context) {
    StoreCubit cubit = StoreCubit.get(context);
    final bool enabled = !cubit.isGroupChoosedFromDropMenu;

    return Form(
      key: groupFormKey,
      child: TextFormField(
        controller: groupCtrl,
        style: TextStyle(
          fontSize: 12+5,
        ),
        decoration: InputDecoration(
          hintText: 'add_new_group'.tr(),
          hintStyle: TextStyle(
            fontSize: 12+5,
          ),
          prefixIcon: Icon(
            Icons.add,
            size: 12+5,
          ),
          border: InputBorder.none,
          errorBorder: const UnderlineInputBorder(),
          errorStyle: TextStyle(
            color: redColor,
            fontSize: 12+5,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10+5),
            borderSide: const BorderSide(
              color: redColor,
              width: 1.7,
            ),
          ),
        ),
        onTap: () {
          cubit.changeIsGroupChoosedFromMenu(false);
          cubit.setGroupName(groupCtrl.text);
        },
        onChanged: (value) {
          groupFormKey.currentState!.validate();

          // if(groupFormKey.currentState!.validate())
          cubit.setGroupName(value);
        },
        readOnly: !enabled,
        textAlign: TextAlign.start,
        validator: (String? value) {
          if (cubit.groupName.isEmpty && value!.isEmpty) {
            return 'must_choose_group'.tr();
          } else if (value!.length >= 35 && !cubit.isGroupChoosedFromDropMenu) {
            return 'too_big_title'.tr();
          }

          return null;
        },
      ),
    );
  }
}

class TitleTextForm extends StatelessWidget {
  const TitleTextForm({
    Key? key,
    required this.titleCtrl,
  }) : super(key: key);

  final TextEditingController titleCtrl;

  @override
  Widget build(BuildContext context) {
    StoreCubit cubit = StoreCubit.get(context);

    return Form(
      key: cubit.titleFormKey,
      child: TextFormField(
        controller: titleCtrl,
        style: TextStyle(
          fontSize: 12+5,
        ),
        decoration: InputDecoration(
          hintText: 'enter_title_here'.tr(),
          hintStyle: TextStyle(
            fontSize: 12+5,
          ),
          border: InputBorder.none,
          errorStyle: TextStyle(
            color: redColor,
            fontSize: 10+5,
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
        autofocus: true,
        onChanged: (value) {
          if (cubit.titleFormKey.currentState!.validate()) {
            cubit.setTitle(value);
          }
        },
        textAlign: TextAlign.center,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'can_not_empty'.tr();
          } else if (value.length >= 30) {
            return 'too_big_title'.tr();
          } else if (StoreHelper.isTitleExists(
            title: value,
            groupIndex: StoreHelper.getGroupIndex(cubit.groupName),
          )) {
            return 'title_already_exists'.tr();
          }

          return null;
        },
      ),
    );
  }
}

void back(BuildContext context) {
  Navigator.pop(context);
}

void onSuccessfulAdd({
  required BuildContext context,
  required String textTitle,
  required String groupName,
  required String messageResult,
}) {
  StoreHelper.addTitleToGroup(
    groupName: groupName,
    groupModel: GroupContentModel(
      title: textTitle,
      ciphertext: messageResult,
    ),
  );

  showToast(
    title: 'added_successfully'.tr(),
    context: context,
    mSeconds: 3000,
  );

  Navigator.pop(context);
}
