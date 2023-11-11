import 'package:liveroute/headers.dart';

class AppRoutes {
  static const String _rHome = '/';
  static const String _rLogin = '/login';
  static const String _rBusRoute = '/:$pvBusRoute';
  static const String _rBusRouteHistory = '/:$pvBusRoute/:$pvBusRouteHistory';
  static const String _rTracking = '/tracking';

  static const String pvBusRoute = 'pBusRoute';
  static const String pvBusRouteHistory = 'pBusRouteHistory';

  // static const String initialRoute = '/route5';
  static const String initialRoute = _rTracking;

  static String rhome() => _rHome;
  static String rLogin() => _rLogin;
  static String rBusRoute({required String busRoute}) => '/$busRoute';
  static String rBusRouteHistory(
          {required String busRoute, required String busRouteHistory}) =>
      '/$busRoute/$busRouteHistory';

  static BusRouteParameters get pBusRoute {
    print("GEt  ${Get.parameters[pvBusRoute]}  ${Get.parameters}");
    return BusRouteParameters(busRoute: Get.parameters[pvBusRoute] ?? '');
  }

  static BusRouteHistoryParameters get pBusRouteHistory {
    return BusRouteHistoryParameters(
      busRoute: Get.parameters[pvBusRoute] ?? '',
      busRouteHistory: Get.parameters[pvBusRouteHistory] ?? '',
    );
  }

  static get routes => <GetPage>[
        GetPage(
          title: 'Login',
          name: _rLogin,
          binding: LoginBinding(),
          page: () => const LoginScreen(),
        ),
        GetPage(
          title: 'Tracking',
          name: _rTracking,
          binding: TrackingBinding(),
          page: () => const TrackingScreen(),
        ),
        GetPage(
          title: 'Home',
          name: _rHome,
          binding: HomeBinding(),
          page: () => const HomeScreen(),
        ),
        GetPage(
          title: 'Bus Route',
          name: _rBusRoute,
          binding: BusRouteBinding(),
          page: () => const BusRouteScreen(),
        ),
        GetPage(
          title: 'Bus Route History',
          name: _rBusRouteHistory,
          binding: BusRouteHistoryBinding(),
          page: () => const BusRouteHistoryScreen(),
        ),
      ];
}
