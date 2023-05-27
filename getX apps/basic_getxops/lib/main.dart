import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'APIs/apis.dart';
import 'screens/home/home_screen.dart';
import 'screens/routes/routes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SnackBar',
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/routes', page: () => const RoutesScreen()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // APIs.showSnackBar();
                  // APIs.showDialog();
                  APIs.getXBottomSheet();
                },
                child: const Text('Click me'),
              ),
              TextButton(
                child: const Text('Move to Home'),
                onPressed: () async {
                  /// `Get.off(const HomeScreen())` is navigating to the `HomeScreen` and removing
                  /// all the previous screens from the navigation stack. It is equivalent to calling
                  /// `Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  /// const HomeScreen()))`.
                  //! Get.off(const HomeScreen());
                  // Get.offAll(const HomeScreen());
                  String HomeData = await Get.to(
                    const HomeScreen(),
                    transition: Transition.cupertino,
                    arguments: 'I am passed as arguement from main',
                    // duration: Duration(milliseconds: 2000),
                    // fullscreenDialog: true,
                  );
                  log(HomeData);
                },
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed("/home");
                },
                child: const Text('Home Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
