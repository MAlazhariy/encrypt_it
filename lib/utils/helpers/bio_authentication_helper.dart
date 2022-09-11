

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  // todo: important to test

  static final _auth = LocalAuthentication();
  static final AndroidAuthMessages _androidStrings = AndroidAuthMessages(
    signInTitle: 'aut_signIn_title'.tr(),
    biometricHint: 'auth_hint'.tr(),
    cancelButton: 'cancel'.tr(),
    biometricNotRecognized: 'auth_biometricNotRecognized'.tr(),
  );



  static Future<bool> hasBiometrics() async {
    try {
      _auth.isDeviceSupported().then((value){
        log('isDeviceSupported : $value');
      });
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    } catch (e){
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
      // todo: deprecated function
      // ignore: deprecated_member_use
      return await _auth.authenticateWithBiometrics(
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: _androidStrings,
        localizedReason: ' ',
      );
    } on PlatformException {
      log('PlatformException');
      return true;
    } catch (e){
      log('exception in authenticate(): ${e.toString()}');
      return true;
    }
  }
}