import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("Go to profile"),
          onPressed: () {
            Get.to(() => const ProfileScreen(), arguments: {'key': 'valu'});
          },
        ),
      ),
    );
  }
}
