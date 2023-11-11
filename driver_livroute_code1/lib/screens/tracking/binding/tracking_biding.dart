import 'package:liveroute/headers.dart';

class TrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackingController>(
      () => TrackingController(),
    );
  }
}
