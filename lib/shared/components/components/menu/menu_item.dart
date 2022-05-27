import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    Key? key,
    required this.onTap,
    required this.title,
    this.subtitle = '',
    required this.icon,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            // color: Colors.grey[800],
            color: Theme.of(context).colorScheme.secondary.withAlpha(210),
            fontSize: 11.sp,
            fontWeight: FontWeight.w600),
      ),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      onTap: onTap,
    );
  }
}
