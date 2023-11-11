import 'package:liveroute/headers.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
      permanent: false,
    );
  }
}
