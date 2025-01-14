import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/utils/constants.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BoardPage1 extends StatelessWidget {
  const BoardPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20+5,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 5+5,
            ),

            // image
            SizedBox(
              // height: 50.h,
              child: Image.asset(
                (getCurrentLang(context) == 'ar')
                    ? 'assets/images/encryption animation ar.gif'
                    : 'assets/images/encryption animation.gif',
                fit: BoxFit.fitWidth,
              ),
            ),

            // headline title
            Text(
              'onBoard_headline_1'.tr(),
              style: TextStyle(
                color: darkBlueColor,
                fontFamily: 'Baloo',
                fontWeight: FontWeight.w600,
                fontSize: 13+5,
              ),
              textAlign: TextAlign.center,
            ),

            // subtitle
            Text(
              'onBoard_subtitle_1'.tr(),
              style: TextStyle(
                color: darkBlueColor.withAlpha(180),
                fontFamily: 'Baloo',
                fontWeight: FontWeight.w500,
                fontSize: 10+5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
