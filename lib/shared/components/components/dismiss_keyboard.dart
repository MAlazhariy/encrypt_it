import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}