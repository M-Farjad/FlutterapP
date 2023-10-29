import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: BackButton(
          onPressed: () {
            log("GET.prieviod Route ${Get.previousRoute}");
            if (Get.previousRoute.isEmpty) {
              Get.offAndToNamed("/");
            } else {
              Get.back();
            }
          },
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text("CART SCREEN"),
            ),
            TextButton(
              child: const Text("Go to Home"),
              onPressed: () {
                Get.offAllNamed('/');
              },
            ),
            TextButton(
              child: const Text("Go to Salman profile"),
              onPressed: () {
                Get.toNamed('/p/salman');
              },
            ),
          ],
        ));
  }
}
