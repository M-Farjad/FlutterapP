import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_soul/named_routes.dart';

class HomeController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController langController = TextEditingController();

  final RxInt selectedIndex = 0.obs;
  final List<String> languages = ['English', 'Spannish', 'French'];

  void handleSave(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      Get.toNamed(NamedRoutes.screen2);
    }
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    langController.text = 'English';
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
