import 'package:liveroute/headers.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          SizedBox(height: 8),
          Logo(logoSize: LogoSize.large),
          SizedBox(height: 40),
          LoginForm(),
          SizedBox(height: 8),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
