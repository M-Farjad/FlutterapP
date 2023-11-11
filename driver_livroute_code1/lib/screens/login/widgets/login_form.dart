import 'package:liveroute/headers.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final lc = Get.find<LoginController>();
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            cursorColor: Colors.black,
            inputFormatters: lc.emailInputFormator,
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            inputFormatters: lc.passwordInputFormator,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          SizedBox(height: rSize(mobile: 30, web: 35)),
          CustomAsyncElevatedButton(
            isNormal: true,
            onTap: lc.login,
          ),
        ],
      ),
    );
  }
}
