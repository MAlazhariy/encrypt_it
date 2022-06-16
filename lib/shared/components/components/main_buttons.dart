
import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/cubit/material_cubit/material_cubit.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:encryption_app/shared/styles/my_icons_icons.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MainButton extends StatefulWidget {
  const MainButton({required this.onPressed, required this.isEncrypt, Key? key})
      : super(key: key);

  final void Function()? onPressed;
  final bool isEncrypt;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Listener(
        onPointerUp: (_) => setState(()=> isPressed = false),
        onPointerDown: (_) => setState(()=> isPressed = true),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: widget.onPressed != null
                // && !isPressed
                ? [
                    BoxShadow(
                      color: shadowColor(context),
                      offset: const Offset(2, 3),
                      blurRadius: 7,
                      spreadRadius: 1,
                      inset: isPressed,
                    ),
                    BoxShadow(
                      color: highLightColor(context),
                      offset: const Offset(-2, -3),
                      blurRadius: 7,
                      spreadRadius: 1,
                      inset: isPressed,
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 6.5,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                // width: 25,
                child: Icon(
                  widget.isEncrypt ? MyIcons.lock : MyIcons.lock_open,
                  size: !isPressed ? 21 : 20,
                  color: widget.onPressed != null
                      ? widget.isEncrypt
                          ? encryptedTextColor
                          : decryptedTextColor
                      : Colors.grey.withOpacity(0.40),
                ),
              ),
              const SizedBox(width: 7),
              Text(
                widget.isEncrypt ? 'encrypt'.tr() : 'decrypt'.tr(),
                style: TextStyle(
                  fontSize: !isPressed ? 18 : 17,
                  fontWeight: FontWeight.w600,
                  color: widget.onPressed != null
                      ? widget.isEncrypt
                          ? encryptedTextColor
                          : decryptedTextColor
                      : Colors.grey.withOpacity(0.40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
