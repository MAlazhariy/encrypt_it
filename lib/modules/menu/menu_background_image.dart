import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuBG extends StatelessWidget {
  const MenuBG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20.h,
      // todo: handle menu background header
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
      child: const Image(
        // image: AssetImage('assets/images/main-animation.gif'),
        image: AssetImage('assets/images/icon.png'),
        fit: BoxFit.contain,
        color: Colors.white,
      ),
      // child: Center(
      //   child: Text(
      //     'menu_headline'.tr(),
      //     style: TextStyle(
      //       fontSize: 17.sp,
      //       color: Colors.white,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
    );
  }
}