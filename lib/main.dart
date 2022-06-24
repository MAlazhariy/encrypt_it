// ignore_for_file: unused_import

/*
* © Mostafa Alazhariy 2021
*/

import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/cubit/material_cubit/material_cubit.dart';
import 'package:encryption_app/cubit/material_cubit/material_states.dart';
import 'package:encryption_app/layout/on_board/on_board_screen.dart';
import 'package:encryption_app/models/text_store_model/text_store_model.dart';
import 'package:encryption_app/shared/network/local/on_board_cache.dart';
import 'package:encryption_app/shared/network/local/text_store_cache.dart';
import 'package:encryption_app/shared/styles/themes/dark_theme.dart';
import 'package:encryption_app/shared/styles/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'cubit/app_cubit/cubit.dart';
import 'layout/home_screen.dart';
import 'shared/components/constants.dart';


void main() async {
  // insure the future methods are executed first before run app
  WidgetsFlutterBinding.ensureInitialized();

  // RequestConfiguration config = RequestConfiguration(
  //   testDeviceIds: <String>['4A92A9DE35E8C65AF79B64ABF57D1274'],
  // );
  // MobileAds.instance.updateRequestConfiguration(config);
  MobileAds.instance.initialize();

  // prevent device orientation changes & force portrait
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );

  // Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MaterialCubit()),
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {

            return BlocConsumer<MaterialCubit, MaterialStates>(
              listener: (context, state){},
              builder: (context, state){
                return MaterialApp(
                  // localization methods
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  // locale: DevicePreview.locale(context), // Devise preview

                  debugShowCheckedModeBanner: false,
                  builder: (context, myWidget) {
                    myWidget = BotToastInit()(context, myWidget);
                    // myWidget = DevicePreview.appBuilder(context, myWidget);
                    return myWidget;
                  },
                  navigatorObservers: [BotToastNavigatorObserver()],

                  home: BoardCache.isBoardSkipped()
                      ? HomeScreen()
                      : const OnBoardScreen(),

                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: MaterialCubit.get(context).isDarkMode == null
                      ? ThemeMode.system
                      : MaterialCubit.get(context).isDarkMode! ? ThemeMode.dark : ThemeMode.light,
                );
              },
            );
          },
        ),
      );
  }
}
