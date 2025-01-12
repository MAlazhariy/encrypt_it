// ignore_for_file: deprecated_member_use

import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key? key,
    required this.title,
    this.isBold = false,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final String title;
  final bool isBold;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: isBold ? color ?? dialogButtonColor(context) : Colors.transparent,
      textColor: isBold
          ? Theme.of(context).scaffoldBackgroundColor
          : color ?? dialogButtonColor(context),
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          fontSize: 11+5,
        ),
      ),
    );
  }
}
