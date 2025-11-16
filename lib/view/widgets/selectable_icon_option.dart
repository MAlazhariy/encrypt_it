import 'package:encryption_app/utils/extensions/context_extension.dart';
import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SelectableIconOption extends StatelessWidget {
  const SelectableIconOption({
    super.key,
    this.color,
    required this.title,
    required this.icon,
    this.subtitle,
    this.onTap,
    this.isSelected,
    this.enabled = true,
  });

  final Color? color;
  final IconData icon;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final bool? isSelected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool isSelectedValue = isSelected == true;
    
    return Opacity(
      opacity: enabled ? 1 : 0.4,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelectedValue
                ? [
                    BoxShadow(
                      color: shadowColor(context),
                      offset: const Offset(2, 2),
                      blurRadius: 6,
                      spreadRadius: 0,
                      inset: true,
                    ),
                    BoxShadow(
                      color: highLightColor(context).withOpacity(0.7),
                      offset: const Offset(-2, -2),
                      blurRadius: 6,
                      spreadRadius: 0,
                      inset: true,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: shadowColor(context),
                      offset: const Offset(3, 3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: highLightColor(context).withOpacity(0.7),
                      offset: const Offset(-3, -3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
          ),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor(context).withOpacity(0.5),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: highLightColor(context).withOpacity(0.5),
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: isSelectedValue 
                      ? (context.isLightTheme ? mainColor : Colors.white)
                      : iconsGrayColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: titlesColor(context),
                        fontSize: 17,
                        fontWeight: isSelectedValue ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          color: titlesColor(context).withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isSelectedValue) ...[
                Icon(
                  Icons.check_circle,
                  size: 26,
                  color: context.isLightTheme ? mainColor : Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

