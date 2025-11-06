import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      _auth.isDeviceSupported().then((value) {
        log('isDeviceSupported : $value');
      });
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    } catch (e) {
      log('error in hasBiometrics(): ${e.toString()}');
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();

    if (!isAvailable) {
      return false;
    }

    try {
      // ignore: deprecated_member_use
      return await _auth.authenticate(
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'aut_signIn_title'.tr(),
            signInHint: 'auth_hint'.tr(),
            cancelButton: 'cancel'.tr(),
            // biometricNotRecognized: 'auth_biometricNotRecognized'.tr(),
          ),
          IOSAuthMessages(
            cancelButton: 'cancel'.tr(),
          ),
        ],
        localizedReason: 'auth_hint'.tr(),
        // options: const AuthenticationOptions(
        //   useErrorDialogs: true,
        //   stickyAuth: true,
        // ),
      );
    } on PlatformException {
      log('PlatformException');
      return true;
    } catch (e) {
      log('exception in authenticate(): ${e.toString()}');
      return true;
    }
  }
}
