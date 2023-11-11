import 'package:liveroute/headers.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 350,
              child: const Column(
                children: [
                  SizedBox(height: 40),
                  Logo(logoSize: LogoSize.large),
                  SizedBox(height: 40),
                  LoginForm(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
