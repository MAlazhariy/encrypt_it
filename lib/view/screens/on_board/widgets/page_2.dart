import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BoardPage2 extends StatelessWidget {
  const BoardPage2({Key? key}) : super(key: key);

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
                fontFamily: 'Baloo',
                fontWeight: FontWeight.w600,
                fontSize: 13+5,
              ),
              textAlign: TextAlign.center,
            ),

            // subtitle
            Text(
              'onBoard_subtitle_2'.tr(),
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
