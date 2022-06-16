import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void showCustomFullDialog({
  required BuildContext context,
  required String title,
  required Widget content,
  List <Widget> buttons = const <Widget>[],
}){
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 100.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              // content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      content,
                    ],
                  ),
                ),
              ),
              // actions
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
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(13),
        // ),
      );
    },
  );
}