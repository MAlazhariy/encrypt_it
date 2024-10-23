// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_collection_literals

import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/decoding/versions/version_05.dart';
import 'package:encryption_app/decoding/versions/version_06.dart';

class Decoding {
  Decoding();

  String decoder({
    required String text,
    required String password,
    required bool isEncrypt,
  }) {
    /// encrypt algorithm
    if (isEncrypt) {
      return V06(text: text, password: password).encrypt();
    }

    if (text.length <= password.length + 2) {
      return 'version_not_found'.tr();
    }

    /// decrypt filter conditions
    String version = text.substring(text.length - 2, text.length);
    String textValue = text.substring(0, text.length - 2);

    if (version == '06') {
      return V06(text: textValue, password: password).decrypt();
    } else if (version == '05') {
      return V05(text: textValue, password: password).decrypt();
    }

    // else
    try {
      int versionNumber = int.parse(version);
      if (versionNumber > 6) {
        return 'later_version_warning_title'.tr();
      } else {
        return 'version_not_found'.tr();
      }
    } catch (e) {
      return 'version_not_found'.tr();
    }
  }
}
