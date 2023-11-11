import 'package:liveroute/headers.dart';
import 'package:liveroute/utilities/snackbar/snackbar.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailInputFormator = [
    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]'))
  ];
  final passwordInputFormator = [
    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]'))
  ];

  Future<void> login() async {
    final res = await _callLogin();
    if (res is String) {
      // ERROR MESSAGE
      uSnackbar(title: 'Error', message: res);
    } else {
      uSnackbar(title: 'Success', message: 'Account login Successfully');
      _onLogin();
    }
  }

  _onLogin() {
    ToRoutes.toHome();
  }

  Future<dynamic> _callLogin() async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      // TODO: Call LOGIN FUNCTION HERE
      // throw 'Password Incorrect';
      // final username = usernameController.text;
      // final password = passwordController.text;
      return null;
    } catch (e) {
      if (e is String) {
        return e;
      }
      return 'Unable To Login';
    }
  }
}
