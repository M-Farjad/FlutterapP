import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class RadioWidget extends StatelessWidget {
  RadioWidget({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.langController.value;
      controller.selectedIndex.value;
      return ListView.builder(
        itemCount: controller.languages.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => RadioListTile(
          title: Text(controller.languages[index]),
          selected: controller.selectedIndex.value == index,
          value: controller.languages[index],
          groupValue: controller.langController.text,
          onChanged: (value) {
            controller.langController.text = value.toString();
            controller.langController.text.printInfo();
            controller.changeSelectedIndex(index);
          },
          activeColor: Colors.deepPurple,
        ),
      );
    });
  }
}
