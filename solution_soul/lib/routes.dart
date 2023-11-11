import 'package:get/get.dart';

import 'home_page.dart';
import 'named_routes.dart';
import 'screen2.dart';

class Routes {
  Routes._();
  static List<GetPage<dynamic>>? routeList = [
    GetPage(name: NamedRoutes.home, page: () => HomePage()),
    GetPage(name: NamedRoutes.screen2, page: () => Screen2()),
    // GetPage(name: NamedRoutes.screen3, page: () => const Screen3()),
  ];
}
