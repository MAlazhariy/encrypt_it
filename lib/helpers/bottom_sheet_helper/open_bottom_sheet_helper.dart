import 'package:encryption_app/helpers/bottom_sheet_helper/on_close_bottom_sheet_helper.dart';
import 'package:encryption_app/modules/bottom_sheet/bottom_sheet_design.dart';
import 'package:flutter/material.dart';

void openBottomSheet(
  bool isEncrypt,
  String pass,
  GlobalKey<ScaffoldState> scaffoldKey,
  BuildContext context,
) {
  scaffoldKey.currentState
      ?.showBottomSheet(
        (context) => BottomSheetDesign(isEncrypt, pass),
      )
      .closed
      .then((_) async {
    onCloseBottomSheet(context);
  });
}
