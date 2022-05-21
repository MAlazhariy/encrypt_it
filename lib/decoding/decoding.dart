// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_collection_literals

import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/decoding/versions/version_05.dart';
import 'package:encryption_app/decoding/versions/version_06.dart';
import 'package:flutter/material.dart';

class Decoding {
  Decoding();

  String decoder(String message, String password, BuildContext context, bool _isEncrypt) {
    /// encrypt algorithm
    if (_isEncrypt) {
      return V06(message, password, context, _isEncrypt).encrypt();
    }

    /// decrypt filter conditions
    String _version = message.substring(message.length - 2, message.length);
    String _messageWithoutVersion = message.substring(0, message.length -2);

    if(_version == '06'){
      return V06(_messageWithoutVersion, password, context, _isEncrypt).decrypt();
    } else if(_version == '05'){
      return V05(_messageWithoutVersion, password, context, _isEncrypt).decrypt();
    }

    // else
    try {
      int _versionNumber = int.parse(_version);
      if(_versionNumber > 5){
        return 'later_version_warning_title'.tr();
      } else {
        return 'version_not_found'.tr();
      }
    } catch (e){
      return 'version_not_found'.tr();
    }

  }
}
