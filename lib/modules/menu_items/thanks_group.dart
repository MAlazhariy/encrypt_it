import 'package:encryption_app/cubit/app_cubit/cubit.dart';
import 'package:encryption_app/modules/menu_items/thanks.dart';
import 'package:encryption_app/shared/components/components/menu/menu_group_items.dart';
import 'package:flutter/material.dart';

class ThanksGroup extends StatelessWidget {
  const ThanksGroup(this.cubit,{Key? key}) : super(key: key);

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          MenuGroupItems([
            ThanksMenuItem(cubit.appInfo.version),
          ]),
          const Divider(),
        ],
      );
  }
}
