import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutesScreen extends StatelessWidget {
  RoutesScreen({super.key});
  void increment() {
    ++count;
  }

  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(
            () => Text('Count is $count '),
          ),
          TextButton(onPressed: increment, child: const Text('Increment')),
        ]),
      ),
    );
  }
}
