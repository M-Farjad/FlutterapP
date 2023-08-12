import 'package:get/get.dart';

import 'controllers/login_controller.dart';
import 'controllers/profile_controller.dart';
import 'controllers/register_controller.dart';

class InitialBinding {
  InitialBinding._();
  static Bindings? initialBinding = BindingsBuilder(() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ProfileController());
  });
}
