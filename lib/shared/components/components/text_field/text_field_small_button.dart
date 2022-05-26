import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sizer/sizer.dart';


class TextFieldQuickActions extends StatefulWidget {
  const TextFieldQuickActions({
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
  State<TextFieldQuickActions> createState() => _TextFieldQuickActionsState();
}

class _TextFieldQuickActionsState extends State<TextFieldQuickActions> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Listener(
        onPointerUp: (_) => setState(()=> isPressed = false),
        onPointerDown: (_) => setState(()=> isPressed = true),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 60),
          decoration: BoxDecoration(
            color: bGColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: widget.onPressed != null && !isPressed
                ? [
              BoxShadow(
                color: shadowColor.withOpacity(0.55),
                offset: const Offset(1.7, 1.7),
                blurRadius: 3,
                spreadRadius: 1,
                inset: isPressed,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.9),
                offset: const Offset(-1.7, -1.7),
                blurRadius: 3,
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
          child: _ButtonDesign(widget.icon, widget.title),
        ),
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 2.5.sp,
        horizontal: 3.5.sp,
      ),
      child: MaterialButton(
        onPressed: widget.onPressed,
        onLongPress: widget.onLongPress,
        color: smallButtonsColor,
        splashColor: mainColor.withAlpha(50),
        textColor: buttonsTitleColor,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: _ButtonDesign(widget.icon, widget.title),
      ),
    );
  }
}



class _ButtonDesign extends StatelessWidget {
  const _ButtonDesign(
      this.icon,
      this.title,
      {Key? key}
      ) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.9.sp,
        vertical: 2.3.sp,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: buttonsTitleColor,
            size: 13.sp,
          ),
          SizedBox(
            width: 3.sp,
          ),
          Text(
            title,
            style: TextStyle(
              color: buttonsTitleColor,
              fontSize: 9.75.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
