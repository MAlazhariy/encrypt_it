import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class MenuGroupItems extends StatelessWidget {
  const MenuGroupItems(this.items, {Key? key}) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bGColor.withAlpha(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }
}