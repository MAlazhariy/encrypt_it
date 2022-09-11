import 'dart:math' as math;
import 'package:flutter/material.dart';

/// set directionality to icons or widgets
/// based on current locale directionality
class MyDirectionality extends StatelessWidget {
  const MyDirectionality({
    Key? key,
    required this.child,
    this.defaultDirectionality = 'rtl',
  }) : super(key: key);

  final Widget child;
  final String defaultDirectionality;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(
        Directionality.of(context).name == defaultDirectionality
            ? 0
            : math.pi,
      ),
      child: child,
    );
  }
}
