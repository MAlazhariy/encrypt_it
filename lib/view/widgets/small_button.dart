import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sizer/sizer.dart';

class SmallButton extends StatefulWidget {
  const SmallButton({
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
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
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
          child: _ButtonDesign(widget.icon, widget.title),
        ),
      ),
    );
  }
}

class _ButtonDesign extends StatelessWidget {
  const _ButtonDesign(this.icon, this.title, {Key? key}) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.9+5,
        vertical: 2.3+5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: smallButtonsContentColor(context),
            size: 13+5,
          ),
          SizedBox(
            width: 3+5,
          ),
          Text(
            title,
            style: TextStyle(
              color: smallButtonsContentColor(context),
              fontSize: 9.75+5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
