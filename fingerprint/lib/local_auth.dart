import 'dart:developer';
import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();
  // static Future<bool> authenticate() async {
  //   final isAvailable = await _auth.canCheckBiometrics;
  //   if (!isAvailable) return false;
  //   final didAuthenticate = await _auth.authenticate(
  //     localizedReason: 'Please authenticate to proceed',
  //     biometricOnly: true,
  //   );
  //   return didAuthenticate;
  // }
  static Future<bool> get isBiometricAvailable async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await isBiometricAvailable;
    if (!isAvailable) return false;
    try {
      return await _auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<List<BiometricType>> get getBiometrics async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      log(e.toString());
      return <BiometricType>[];
    }
  }

  static getFingerPrint() async {
    final isAvailable = await isBiometricAvailable;
    if (!isAvailable) return false;
    try {
      return _auth.jsify();
    } on PlatformException catch (e) {
      log(e.toString());
      return false;
    }
  }
}
