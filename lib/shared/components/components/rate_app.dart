import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/shared/network/local/rate_app_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
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
            style: const TextStyle(
              color: darkGrayColor,
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
                  padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 5.sp,),
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
                    onTap: (){
                      rateOpenGoogle();
                    },
                  ),
                ),

                /// rate description
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 5.sp,
                    start: 15.sp,
                    end: 15.sp,
                  ),
                  child: Center(
                    child: Text(
                      'rate_app_description'.tr(),
                      style: TextStyle(
                        color: darkGrayColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp,),

                /// rate button
                MaterialButton(
                  color: redColor,
                  textColor: contrastColor,

                  elevation: 0,
                  highlightElevation: 0,
                  focusElevation: 0,
                  disabledElevation: 0,
                  hoverElevation: 0,
                  onPressed: (){
                    rateOpenGoogle();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 3.sp,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Icon(
                        //   Icons.favorite_rounded,
                        // ),
                        // SizedBox(width: 5.sp,),
                        Text(
                          'rate_app_title'.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 13.sp,
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
                        onPressed: (){
                          Navigator.pop(context);
                        },

                        elevation: 0,
                        highlightElevation: 0,
                        focusElevation: 0,
                        disabledElevation: 0,
                        hoverElevation: 0,
                        padding: EdgeInsets.symmetric(
                          vertical: 2.sp,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(12.sp),
                            )
                        ),
                        child: Text(
                          'remind_later'.tr(),
                          style: TextStyle(
                            color: redColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.5.sp,
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
                          vertical: 2.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(12.sp),
                          )
                        ),

                        onPressed: (){
                          RateCache.appRatedSuccessfully();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'no_thanks'.tr(),
                          style: TextStyle(
                            color: redColor.withAlpha(210),
                            fontWeight: FontWeight.w500,
                            fontSize: 10.5.sp,
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
          borderRadius: BorderRadius.circular(12.sp),
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

void rateOpenGoogle(){
  final InAppReview inAppReview = InAppReview.instance;
  inAppReview.openStoreListing();
  RateCache.appRatedSuccessfully();
}
