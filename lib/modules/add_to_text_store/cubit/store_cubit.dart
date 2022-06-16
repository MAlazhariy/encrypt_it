import 'package:encryption_app/modules/add_to_text_store/cubit/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreCubit extends Cubit<StoreStates>{
  StoreCubit() : super(StoreInitState());

  var groupFormKey = GlobalKey<FormState>();
  var titleFormKey = GlobalKey<FormState>();

  bool isGroupChoosedFromDropMenu = true;
  String? choosedGroup;
  String groupName = '';
  String title = '';
  bool isGroupCompleted = false;

  static StoreCubit get(BuildContext context){
    return BlocProvider.of(context);
  }

  void setGroupName(String value){
    groupName = value;
    emit(ChangeGroupStoreState());
  }

  void changeChoosedGroup(String value){
    choosedGroup = value;
    isGroupChoosedFromDropMenu = true;
    emit(ChangeChoosedGroupStoreState());
  }

  void changeIsGroupChoosedFromMenu(bool isFromMenu){
    isGroupChoosedFromDropMenu = isFromMenu;
    if(isFromMenu == false) {
      choosedGroup = null;
    }
    emit(AddNewGroupStoreState());
  }

  void setCompleteGroup({bool isComplete = true}){
    isGroupCompleted = isComplete;
    emit(CompleteGroupStoreState());
  }

  void setTitle(String value){
    title = value;
    emit(SetTitleStoreState());
  }

}