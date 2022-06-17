// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/models/text_store_model.dart';
import 'package:flutter/material.dart';

bool authenticated = false;
StoreModel? groups;

void changeLang(BuildContext context){
  if(currentLang(context)=='ar'){
    context.locale = const Locale('en');
  } else {
    context.locale = const Locale('ar');
  }
}

String currentLang(BuildContext context){
  return context.locale.languageCode;
}



class Links{
  // static const String contactUs = 'https://m.me/encryptitapp';
  static Uri mailUs({
    required String subject,
    String body = '',
  }) {
    const email = 'encryptitapp@gmail.com';
    return Uri.parse(
      'mailto:$email?subject=$subject&body=$body',
    );
  }

  static final privacyPolicy = Uri.parse('https://sites.google.com/view/ceen-privace-policy');
  static final facebookPage = Uri.parse('https://www.facebook.com/encryptitapp');
  static final appOnGooglePlay = Uri.parse('https://play.google.com/store/apps/details?id=malazhariy.encryptIt');
  static final githubRepository = Uri.parse('https://github.com/MAlazhariy/Encryption_App');
}