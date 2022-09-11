import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/controllers/material_cubit/material_cubit.dart';
import 'package:encryption_app/controllers/material_cubit/material_states.dart';
import 'package:encryption_app/view/screens/on_board/on_board_screen.dart';
import 'package:encryption_app/network/local/on_board_cache.dart';
import 'package:encryption_app/utils/style/themes/dark_theme.dart';
import 'package:encryption_app/utils/style/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'controllers/app_cubit/cubit.dart';
import 'view/screens/home/home_screen.dart';

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
            listener: (context, state) {},
            builder: (context, state) {
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
                    : MaterialCubit.get(context).isDarkMode!
                        ? ThemeMode.dark
                        : ThemeMode.light,
              );
            },
          );
        },
      ),
    );
  }
}
