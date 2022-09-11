import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sizer/sizer.dart';

class BottomSheetButton extends StatefulWidget {
  const BottomSheetButton({
    required this.title,
    required this.onPressed,
    required this.icon,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final IconData icon;
  final String title;

  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}

class _BottomSheetButtonState extends State<BottomSheetButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onLongPress: widget.onLongPress,
      child: Listener(
        onPointerUp: (_) => setState(() => isPressed = false),
        onPointerDown: (_) => setState(() => isPressed = true),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 60),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: widget.onPressed != null && !isPressed
                ? [
                    BoxShadow(
                      color: shadowColor(context),
                      offset: const Offset(1, 1.7),
                      blurRadius: 4,
                      spreadRadius: 1,
                      inset: isPressed,
                    ),
                    BoxShadow(
                      color: highLightColor(context).withOpacity(0.9),
                      offset: const Offset(-1, -1.7),
                      blurRadius: 4,
                      spreadRadius: 1,
                      inset: isPressed,
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.9.sp,
              vertical: 2.3.sp,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color: smallButtonsContentColor(context),
                  size: 15.sp,
                ),
                SizedBox(
                  width: 3.sp,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: smallButtonsContentColor(context),
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
