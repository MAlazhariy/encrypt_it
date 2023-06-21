// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/models/text_store_model.dart';
import 'package:flutter/material.dart';

bool authenticated = false;
StoreModel? groups;

class AppConstants {
  static const String appName = "Encrypt It";
}

void changeLang(BuildContext context) {
  if (getCurrentLang(context) == 'ar') {
    context.locale = const Locale('en');
  } else {
    context.locale = const Locale('ar');
  }
}

String getCurrentLang(BuildContext context) => context.locale.languageCode;

class Links {
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
  static final gitHubRepository = Uri.parse('https://github.com/MAlazhariy/encrypt_it');

  // my social media
  static final gitHubProfile = Uri.parse('https://github.com/MAlazhariy');
  static final linkedInProfile = Uri.parse('https://www.linkedin.com/in/malazhariy/');
  static final youtubeChannel = Uri.parse('https://www.youtube.com/@MAlazhariy');
}
