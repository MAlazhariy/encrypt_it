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
        color: const Color(0xFF595a5d),
        fontWeight: FontWeight.w600,
      ),
      descTextStyle: TextStyle(
        fontSize: 12.sp,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      radius: BorderRadius.circular(13),
      overlayOpacity: 0.5,
      child: child,
    );
  }
}
