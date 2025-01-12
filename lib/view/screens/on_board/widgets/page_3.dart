import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BoardPage3 extends StatelessWidget {
  const BoardPage3({Key? key}) : super(key: key);

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
            // image
            SizedBox(
              child: Icon(
                Icons.favorite_outlined,
                color: mainColor,
                size: 100+5,
              ),
            ),

            SizedBox(
              height: 10+5,
            ),

            // headline title
            Text(
              'onBoard_headline_3'.tr(),
              style: TextStyle(
                color: mainColor,
                fontFamily: 'Baloo',
                fontWeight: FontWeight.w500,
                fontSize: 12+5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
