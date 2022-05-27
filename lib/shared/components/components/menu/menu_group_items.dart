import 'package:flutter/material.dart';

class MenuGroupItems extends StatelessWidget {
  const MenuGroupItems(this.items, {Key? key}) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items,
    );
  }
}