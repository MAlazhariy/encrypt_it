import 'package:encryption_app/view/widgets/main_button.dart';
import 'package:flutter/material.dart';

import 'drawer_items/change_theme_bottom_sheet.dart';

class ThemeTestScreen extends StatelessWidget {
  const ThemeTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Test'),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) => const ChangeThemeBottomSheetWidget(),
            );
          },
          child: Text("change theme"),
        ),
      ),
    );
  }
}
