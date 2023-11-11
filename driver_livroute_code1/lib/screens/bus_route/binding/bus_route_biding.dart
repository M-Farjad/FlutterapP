import 'package:liveroute/headers.dart';

class BusRouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BusRouteBinding(),
      permanent: false,
    );
  }
}
