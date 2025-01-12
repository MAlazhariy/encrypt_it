import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle = '',
    required this.icon,
    this.suffixIcon,
  });

  final void Function()? onTap;
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: titlesColor(context),
                fontSize: 13.5+5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: TextStyle(
                color: titlesColor(context),
                fontSize: 10+5,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      // width between leading icon and title
      minLeadingWidth: 16+5,
      leading: Icon(
        icon,
        color: iconsGrayColor,
        size: 15+5,
      ),
      onTap: onTap,
    );
  }
}
