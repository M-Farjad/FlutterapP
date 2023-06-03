import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Services'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'The value is: ${Get.find<HomeController>().count}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.find<HomeController>().increment();
              },
              child: Text('increment'),
            ),
            //? Move to Home
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Back'),
            )
          ],
        ),
      )),
    );
  }
}
