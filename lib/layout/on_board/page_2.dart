import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BoardPage2 extends StatelessWidget {
  const BoardPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 5.sp,
            ),

            // image
            SizedBox(
              child: Image.asset(
                'assets/images/main-animation.gif',
                // 'assets/images/icon.png',
                fit: BoxFit.contain,
                color: darkBlueColor.withAlpha(180),
                // color: Theme.of(context).colorScheme.secondary.withAlpha(250),
              ),
            ),

            // headline title
            Text(
              'onBoard_headline_2'.tr(),
              style: TextStyle(
                color: darkBlueColor,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.center,
            ),

            // subtitle
            Text(
              'onBoard_subtitle_2'.tr(),
              style: TextStyle(
                color: darkBlueColor.withAlpha(180),
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}