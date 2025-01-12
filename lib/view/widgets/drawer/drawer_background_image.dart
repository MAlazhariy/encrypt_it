import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuBG extends StatelessWidget {
  const MenuBG({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Container(
      width: double.infinity,
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       mainColor,
      //       bGColor,
      //       mainColor,
      //       // BGColor,
      //     ],
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //   ),
      // ),
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
      ),
      child: Column(
        children: [
          // logo image
          Image(
            image: const AssetImage(
              'assets/images/icon.png',
            ),
            height: 55+5,
            color: dialogButtonColor(context),
          ),
          SizedBox(height: 3+5),
          // app name
          Text(
            cubit.appInfo.appName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12+5,
              color: smallButtonsContentColor(context),
            ),
          ),
          // app version
          // SizedBox(height: 2+5),
          Text(
            cubit.appInfo.version,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11+5,
            ),
          ),
        ],
      ),
      // child: Center(
      //   child: Text(
      //     'menu_headline'.tr(),
      //     style: TextStyle(
      //       fontSize: 17+5,
      //       color: Colors.white,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
    );
  }
}
