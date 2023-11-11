import 'package:liveroute/headers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
      permanent: false,
    );
  }
}
