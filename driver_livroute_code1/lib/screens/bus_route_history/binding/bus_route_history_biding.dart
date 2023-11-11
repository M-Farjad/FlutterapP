import 'package:liveroute/headers.dart';

class BusRouteHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BusRouteHistoryController(),
      permanent: false,
    );
  }
}
