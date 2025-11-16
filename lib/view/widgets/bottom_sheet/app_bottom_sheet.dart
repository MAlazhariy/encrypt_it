import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.children,
    this.title,
    this.showDragHandle = true,
  });

  final List<Widget> children;
  final String? title;
  final bool showDragHandle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor(context).withOpacity(0.3),
              offset: const Offset(0, -2),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showDragHandle) ...[
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: iconsGrayColor.withAlpha(100),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const SizedBox(height: 25),
              ],
              if (title != null) ...[
                Text(
                  title!,
                  style: TextStyle(
                    color: titlesColor(context),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
              ],
              ...children,
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

