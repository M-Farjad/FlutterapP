import 'package:liveroute/headers.dart';

class ToRoutes {
  static void toHome({bool offAll = true}) {
    final route = AppRoutes.rhome();
    offAll ? Get.offAllNamed(route) : Get.toNamed(route);
  }

  static void toBusRoute({required String busRoute, bool off = false}) {
    final route = AppRoutes.rBusRoute(busRoute: busRoute);
    off ? Get.offAndToNamed(route) : Get.toNamed(route);
  }

  static void toBusRouteHistory({
    required String busRoute,
    required String busRouteHistory,
    bool offAll = false,
  }) {
    final route = AppRoutes.rBusRouteHistory(
      busRoute: busRoute,
      busRouteHistory: busRouteHistory,
    );
    offAll ? Get.offAllNamed(route) : Get.toNamed(route);
  }

  static void toLogin({
    bool offAll = true,
  }) {
    final route = AppRoutes.rLogin();
    offAll ? Get.offAllNamed(route) : Get.toNamed(route);
  }
}
