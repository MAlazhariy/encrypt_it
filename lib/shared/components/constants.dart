// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
  static String mailUs({
    required String subject,
    String body = '',
}) {
    const String email = 'encryptitapp@gmail.com';
    return 'mailto:$email?subject=$subject&body=$body';
}
  static const String privacyPolicy = 'https://sites.google.com/view/ceen-privace-policy';
  static const String facebookPage = 'https://www.facebook.com/encryptitapp';
  static const String appOnGooglePlay = 'https://play.google.com/store/apps/details?id=malazhariy.encryptIt';
}