// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_collection_literals

import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/decoding/versions/version_05.dart';
import 'package:encryption_app/decoding/versions/version_06.dart';
import 'package:flutter/material.dart';

class Decoding {
  Decoding();

  String decoder({
    required String message,
    required String password,
    required BuildContext context,
    required bool isEncrypt,
  }) {
    /// encrypt algorithm
    if (isEncrypt) {
      return V06(message, password, context, isEncrypt).encrypt();
    }

    /// decrypt filter conditions
    String version = message.substring(message.length - 2, message.length);
    String messageWithoutVersion = message.substring(0, message.length - 2);

    if (version == '06') {
      return V06(messageWithoutVersion, password, context, isEncrypt).decrypt();
    } else if (version == '05') {
      return V05(messageWithoutVersion, password, context, isEncrypt).decrypt();
    }

    // else
    try {
      int versionNumber = int.parse(version);
      if (versionNumber > 5) {
        return 'later_version_warning_title'.tr();
      } else {
        return 'version_not_found'.tr();
      }
    } catch (e) {
      return 'version_not_found'.tr();
    }
  }
}
