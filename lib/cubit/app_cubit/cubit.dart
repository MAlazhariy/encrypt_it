
import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/cubit/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitState());

  bool isButtonsActive = false;
  String textResult = '';
  bool isPasswordHidden = true;
  IconData passwordIcon = Icons.visibility;
  /// You can know which current field that the user is on through this variable
  Fields currentTextField = Fields.none;
  PackageInfo appInfo = PackageInfo(appName: '   '.tr(), packageName: '', version: '   ', buildNumber: '');

  static AppCubit get(BuildContext context){
    return BlocProvider.of(context);
  }

  // get app info
  Future<void> getAppInfo() async {
    PackageInfo.fromPlatform().then((value) {
      appInfo = value;
      emit(AppGetVersionState());
    });
  }

  // current field functions
  void setCurrentFieldToText(){
    currentTextField = Fields.text;
    emit(AppOnTextState());
  }
  bool get isCurrentFieldText{
    return currentTextField == Fields.text;
  }

  void setCurrentFieldToPassword(){
    currentTextField = Fields.password;
    emit(AppOnPasswordState());
  }
  bool get isCurrentFieldPassword{
    return currentTextField == Fields.password;
  }

  void setCurrentFieldToNoneAndInactivated(){
    currentTextField = Fields.noneAndInactivatedFields;
    emit(AppOnNoneInactivatedState());
  }
  bool get isCurrentFieldNoneAndInactivated{
    return currentTextField == Fields.noneAndInactivatedFields;
  }
  void setCurrentFieldToNone(){
    currentTextField = Fields.none;
    emit(AppOnNoneState());
  }

  // set buttons pressable
  void setButtonsPressable(bool boolean) {
    isButtonsActive = boolean;
    emit(AppActiveButtonsState());
  }

  // set the result (ciphertext or decrypted text)
  void setTextResult(String text){
    textResult = text;
    emit(AppSetTextResultState());
  }

  // password
  void showPassword(){
    isPasswordHidden = false;
    passwordIcon = Icons.visibility_off;
    emit(AppShowPasswordState());
  }
  void hidePassword(){
    isPasswordHidden = true;
    passwordIcon = Icons.visibility;
    emit(AppHidePasswordState());
  }
  void showAndHidePassword(){
    return isPasswordHidden
        ? showPassword()
        : hidePassword();
  }

  // clear all method
  void clearAllFields(){
    // make password field hidden
    isPasswordHidden = true;
    passwordIcon = Icons.visibility;

    // deactivate the main buttons
    isButtonsActive = false;

    // set current field to none
    currentTextField = Fields.none;
    emit(AppClearAllState());
  }

}



enum Fields {
  /// When user be in the main text field (encrypted and plain text field)
  text,
  /// When user be in the password field
  password,
  /// If user does not on any of the above fields
  none,
  /// I use this option when opening a bottom sheet that fills the screen
  /// then I do not want any of the fields to be enabled
  noneAndInactivatedFields,
}