import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void showToast({
  @required String title,
  int mSeconds = 1500,
  @required Color textColor,
  @required Color contentFillColor,
}) {
  BotToast.showText(
    text: title,
    duration: Duration(milliseconds: mSeconds),
    contentColor: contentFillColor,
    textStyle: TextStyle(
      color: textColor,
      fontWeight: FontWeight.w600,
    ),
    borderRadius: BorderRadius.circular(12.sp),
    clickClose: true,
  );
}