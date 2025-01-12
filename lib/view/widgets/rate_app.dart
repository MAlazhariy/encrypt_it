import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/network/local/rate_app_cache.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:sizer/sizer.dart';

void showRateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'rate_app'.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        content: SizedBox(
          width: 72.w,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// stars
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14+5,
                    vertical: 5+5,
                  ),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10.w,
                        ),
                      ),
                    ),
                    onTap: () {
                      rateOpenGoogle();
                    },
                  ),
                ),

                /// rate description
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 5+5,
                    start: 15+5,
                    end: 15+5,
                  ),
                  child: Center(
                    child: Text(
                      'rate_app_description'.tr(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 10+5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8+5,
                ),

                /// rate button
                MaterialButton(
                  color: redColor,
                  textColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  highlightElevation: 0,
                  focusElevation: 0,
                  disabledElevation: 0,
                  hoverElevation: 0,
                  onPressed: () {
                    rateOpenGoogle();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 3+5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Icon(
                        //   Icons.favorite_rounded,
                        // ),
                        // SizedBox(width: 5+5,),
                        Text(
                          'rate_app_title'.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 13+5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    /// remind later button
                    Expanded(
                      flex: 3,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 0,
                        highlightElevation: 0,
                        focusElevation: 0,
                        disabledElevation: 0,
                        hoverElevation: 0,
                        padding: EdgeInsets.symmetric(
                          vertical: 2+5,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(12+5),
                        )),
                        child: Text(
                          'remind_later'.tr(),
                          style: TextStyle(
                            color: redColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.5+5,
                          ),
                        ),
                      ),
                    ),

                    /// no thanks button
                    Expanded(
                      flex: 2,
                      child: MaterialButton(
                        elevation: 0,
                        highlightElevation: 0,
                        focusElevation: 0,
                        disabledElevation: 0,
                        hoverElevation: 0,
                        padding: EdgeInsets.symmetric(
                          vertical: 2+5,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(12+5),
                        )),
                        onPressed: () {
                          RateCache.appRatedSuccessfully();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'no_thanks'.tr(),
                          style: TextStyle(
                            color: redColor.withAlpha(210),
                            fontWeight: FontWeight.w500,
                            fontSize: 10.5+5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12+5),
        ),
      );
    },
  );
}

Future<void> showInAppRate() async {
  final InAppReview inAppReview = InAppReview.instance;
  if (await inAppReview.isAvailable()) {
    inAppReview.requestReview();
  }
}

void rateOpenGoogle() {
  final InAppReview inAppReview = InAppReview.instance;
  inAppReview.openStoreListing();
  RateCache.appRatedSuccessfully();
}
