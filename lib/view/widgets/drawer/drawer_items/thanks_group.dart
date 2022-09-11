import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_group_items.dart';
import 'package:encryption_app/view/widgets/drawer/drawer_items/thanks.dart';
import 'package:flutter/material.dart';

class ThanksGroup extends StatelessWidget {
  const ThanksGroup({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          MenuGroupItems([
            ThanksMenuItem(AppCubit.get(context).appInfo.version),
          ]),
          const Divider(),
        ],
      );
  }
}
