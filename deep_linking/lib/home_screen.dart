import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                child: const Text("Go to profile"),
                onPressed: () {
                  Get.toNamed('/p/salman');
                },
              ),
              TextButton(
                child: const Text("Go to Cart"),
                onPressed: () {
                  Get.toNamed('/cart');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
