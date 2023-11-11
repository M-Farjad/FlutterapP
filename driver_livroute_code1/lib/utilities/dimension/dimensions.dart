import 'package:liveroute/headers.dart';
import 'dart:io';

const double _wMobile = 500;
const double _wTablet = 900;

Widget rView<Widget>({
  required BuildContext context,
  required Widget desktop,
  required Widget mobile,
  Widget? tablet,
}) {
  final size = MediaQuery.of(context).size;

  if (_wMobile > size.width) {
    return mobile;
  } else if (_wTablet > size.width) {
    return tablet ?? desktop;
  } else {
    return desktop;
  }
}

double rSize<double>({
  required final double mobile,
  required final double? web,
  final double? desktop,
}) {
  if (kIsWeb) {
    return web ?? mobile;
  } else {
    if (Platform.isAndroid) {
      return mobile;
    } else {
      return desktop ?? web ?? mobile;
    }
  }
}
