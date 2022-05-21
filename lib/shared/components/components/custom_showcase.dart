import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sizer/sizer.dart';

class CustomShowcase extends StatelessWidget {
  const CustomShowcase({
    required this.globalKey,
    required this.description,
    required this.child,
    this.title,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final GlobalKey globalKey;
  final String description;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: globalKey,
      title: title,
      description: description,
      titleTextStyle: TextStyle(
        fontSize: 10.sp,
        color: lightGrayColor,
        fontWeight: FontWeight.w600,
      ),
      descTextStyle: TextStyle(
        fontSize: 12.sp,
        color: darkGrayColor,
        fontWeight: FontWeight.w500,
      ),
      radius: BorderRadius.circular(10.sp),
      overlayOpacity: 0,
      child: child,
    );
  }
}
