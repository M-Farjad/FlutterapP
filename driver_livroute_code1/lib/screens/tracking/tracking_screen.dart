import 'package:liveroute/headers.dart';

import './view/body.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      child: Body(),
    );
  }
}
