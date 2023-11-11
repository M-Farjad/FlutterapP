import 'package:liveroute/headers.dart';

import './view/body.dart';

class ScreenScreen extends StatelessWidget {
  const ScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      child: Body(),
    );
  }
}
