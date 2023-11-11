import 'package:liveroute/headers.dart';

import './view/body.dart';

class BusRouteScreen extends StatelessWidget {
  const BusRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      child: Body(),
    );
  }
}
