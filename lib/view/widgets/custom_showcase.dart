import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sizer/sizer.dart';

class CustomShowcase extends StatelessWidget {
  const CustomShowcase({
    required this.globalKey,
    required this.description,
    required this.child,
    this.title,
    this.callback,
    super.key,
  });

  final Widget child;
  final GlobalKey globalKey;
  final String description;
  final String? title;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: globalKey,
      title: title,
      description: description,
      titleTextStyle: TextStyle(
        fontSize: 10+5,
        color: const Color(0xFF595a5d),
        fontWeight: FontWeight.normal,
      ),
      descTextStyle: TextStyle(
        fontSize: 12+5,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      // radius: BorderRadius.circular(13),
      overlayOpacity: 0.5,
      onBarrierClick: callback,
      onTargetClick: callback,
      disposeOnTap: callback != null ? true : null,
      child: child,
    );
  }
}
