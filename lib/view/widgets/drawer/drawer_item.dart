import 'package:encryption_app/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    Key? key,
    this.onTap,
    required this.title,
    this.subtitle = '',
    required this.icon,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: titlesColor(context),
          fontSize: 13.5.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      // width between leading icon and title
      minLeadingWidth: 16.sp,
      leading: Icon(
        icon,
        color: iconsGrayColor,
        size: 15.sp,
      ),
      onTap: onTap,
    );
  }
}
