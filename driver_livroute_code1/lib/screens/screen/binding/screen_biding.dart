import 'package:liveroute/headers.dart';

class ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenController>(
      () => ScreenController(),
    );
  }
}
