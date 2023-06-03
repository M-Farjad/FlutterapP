import 'package:get/get.dart';

import '../controller/my_controller.dart';

class MyAppControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
  }
}
