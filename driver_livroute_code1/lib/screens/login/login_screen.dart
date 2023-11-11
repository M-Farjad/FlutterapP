import 'package:liveroute/headers.dart';

import './view/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      child: Body(),
    );
  }
}
