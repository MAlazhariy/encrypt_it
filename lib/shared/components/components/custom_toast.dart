import 'package:bot_toast/bot_toast.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void showToast({
  required String title,
  required BuildContext context,
  int mSeconds = 1500,
  bool contrast = false,
  // required Color textColor,
  // required Color contentFillColor,
}) {
  BotToast.showText(
    text: title,
    duration: Duration(milliseconds: mSeconds),
    contentColor: contrast
        ? dialogButtonColor(context)
        : Theme.of(context).scaffoldBackgroundColor,

    textStyle: TextStyle(
      color: contrast
          ? Theme.of(context).scaffoldBackgroundColor
          : smallButtonsContentColor(context),
      fontWeight: FontWeight.w600,
    ),
    borderRadius: BorderRadius.circular(12.sp),
    clickClose: true,
  );
}