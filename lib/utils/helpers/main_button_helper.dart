import 'package:encryption_app/controllers/app_cubit/cubit.dart';
import 'package:encryption_app/decoding/decoding.dart';
import 'package:encryption_app/utils/helpers/dismiss_keyboard.dart';
import 'package:encryption_app/network/local/operation_counter_cache.dart';
import 'package:encryption_app/view/widgets/bottom_sheet/widgets/bottom_sheet_helper.dart';
import 'package:flutter/material.dart';

/// The main button is the button you press to ENCRYPT or DECRYPT a text
void Function()? onPressMainButton({
  required BuildContext context,
  required bool isEncrypt,
  required String msg,
  required String pass,
  required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  var cubit = AppCubit.get(context);

  debugPrint("> onPressMainButton - isButtonsActive: ${cubit.isButtonsActive}");

  if (cubit.isButtonsActive) {
    return () {
      // increase operations counter
      if(!isEncrypt) {
        OperationCounterCache.increaseCounter();
      }

      cubit.setCurrentFieldToNone();
      dismissKeyboard(context);

      // decoding the text & set result in cubit
      // to show in bottom sheet
      cubit.setTextResult(
        Decoding().decoder(
          text: msg,
          password: pass,
          isEncrypt: isEncrypt,
        ),
      );

      bottomSheetHelper(context, isEncrypt, msg, pass, scaffoldKey);
    };
  }

  return null;
}
