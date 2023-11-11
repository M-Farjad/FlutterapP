import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/login/view/desktop_view.dart';
import 'package:liveroute/screens/login/view/mobile_view.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: rView(
        context: context,
        desktop: const DesktopView(),
        mobile: const MobileView(),
      ),
    );
  }
}
