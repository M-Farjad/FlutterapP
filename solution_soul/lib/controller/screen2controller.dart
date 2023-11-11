import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_soul/named_routes.dart';

class Screen2Controller extends GetxController {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController langController = TextEditingController();

  final TextEditingController q1Controller = TextEditingController();
  final TextEditingController q2Controller = TextEditingController();
  final TextEditingController q3Controller = TextEditingController();
  final TextEditingController q4Controller = TextEditingController();

  void handleSave(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      Get.toNamed(NamedRoutes.screen3);
    }
  }

  // void changeSelectedIndex(int index) {
  //   selectedIndex.value = index;
  // }

  @override
  void onInit() {
    langController.text = 'English';
    super.onInit();
  }

  @override
  void onClose() {
    questionController.dispose();
    descController.dispose();
    super.onClose();
  }
}
