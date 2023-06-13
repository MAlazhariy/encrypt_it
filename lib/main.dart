// ignore_for_file: unused_import

/*
* © Mostafa Alazhariy 2021
*/

import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/controllers/material_cubit/material_cubit.dart';
import 'package:encryption_app/controllers/material_cubit/material_states.dart';
import 'package:encryption_app/my_app.dart';
import 'package:encryption_app/view/screens/on_board/on_board_screen.dart';
import 'package:encryption_app/models/text_store_model.dart';
import 'package:encryption_app/network/local/on_board_cache.dart';
import 'package:encryption_app/network/local/text_store_cache.dart';
import 'package:encryption_app/utils/style/themes/dark_theme.dart';
import 'package:encryption_app/utils/style/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'controllers/app_cubit/cubit.dart';
import 'view/screens/home/home_screen.dart';
import 'utils/constants.dart';

void main() async {
  // insure the future methods are executed first before run app
  WidgetsFlutterBinding.ensureInitialized();

  // prevent device orientation changes & force portrait
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );

  // Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();

  // todo: remove
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  groups = StoreModel.fromJson(TextStoreCache.getGroups());

  runApp(
    EasyLocalization(
      supportedLocales: const[Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}
