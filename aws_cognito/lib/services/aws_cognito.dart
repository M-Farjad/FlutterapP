import 'dart:developer';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AWSServices {
  static final userPool = CognitoUserPool(
    '${dotenv.env['POOL_ID']}',
    '${dotenv.env['CLIENT_ID']}',
  );
  static Future createInitialRecord(email, password) async {
    log('Creating initial record');
    final cognitoUser = CognitoUser(email, userPool);
    final authDetails =
        AuthenticationDetails(username: email, password: password);
    try {
      // CognitoUserSession? session;
      await cognitoUser.authenticateUser(authDetails);
      log('User authenticated');
    } on CognitoUserNewPasswordRequiredException catch (e) {
      log('New password required: ${e.message}');
    } on CognitoUserMfaRequiredException catch (e) {
      log('MFA required: ${e.message}');
    } on CognitoUserSelectMfaTypeException catch (e) {
      log('Select MFA type: ${e.message}');
    } on CognitoUserMfaSetupException catch (e) {
      log('MFA setup: ${e.message}');
    } on CognitoUserTotpRequiredException catch (e) {
      log('TOTP required: ${e.message}');
    } on CognitoUserCustomChallengeException catch (e) {
      log('Custom challenge: ${e.message}');
    } on CognitoUserConfirmationNecessaryException catch (e) {
      log('Confirmation necessary: ${e.message}');
    } on CognitoClientException catch (e) {
      log('Client exception: ${e.message}');
    } catch (e) {
      log('Error: ${e.toString()}');
    }
  }
}
