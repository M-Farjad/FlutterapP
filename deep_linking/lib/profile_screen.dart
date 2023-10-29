import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profile = Get.parameters['id'] ?? 'No Profile Given';

  // @override
  // void initState() {
  //   // final productId = Get.parameters['id'] ?? 'No Profile Given';
  //   // now fetch data from api ...
  //   // reload screen . to show updated data
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    log("ProfileScreen.build");
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            log("GET.previous Route ${Get.previousRoute}");
            if (Get.previousRoute.isEmpty) {
              Get.offAndToNamed("/");
            } else {
              Get.back();
            }
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(profile),
            ),
            TextButton(
              child: const Text("Go to Cart"),
              onPressed: () {
                Get.toNamed('/cart');
              },
            ),
            TextButton(
              child: const Text("Go to Home"),
              onPressed: () {
                Get.offAllNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
