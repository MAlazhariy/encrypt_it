import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void customAlertDialog({
  required BuildContext context,
  required String title,
  required String alertDescription,
  required IconData alertIcon,
  List<Widget> buttons = const <Widget>[],
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: 72.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // icon
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 20.sp,
                  horizontal: 5.sp,
                ),
                decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.sp),
                    topLeft: Radius.circular(12.sp),
                  ),
                ),
                child: Icon(
                  alertIcon,
                  size: 50.sp,
                  color: Colors.white,
                ),
              ),

              // alert widget
              SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.sp,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: redColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(
                        height: 3.sp,
                      ),
                      Text(
                        alertDescription,
                        style: TextStyle(
                          // color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Wrap(
                spacing: 4.sp,
                children: buttons,
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
      );
    },
  );
}
