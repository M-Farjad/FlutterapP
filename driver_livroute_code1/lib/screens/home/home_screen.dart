import 'package:liveroute/headers.dart';

import './view/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      child: Body(),
    );
  }
}
