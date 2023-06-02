import 'dart:developer';

import 'package:basic_getxops/APIs/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'APIs/apis.dart';
import 'controllers/my_controller.dart';
import 'screens/home/home_screen.dart';
import 'screens/routes/routes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // for whole Rx class
  // final student = Student(age: 25, name: 'Farjad').obs;
  MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SnackBar',
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/routes', page: () => RoutesScreen()),
        // GetPage(name: '/routes:someparam', page: () => const RoutesScreen()),
      ],
      // unknownRoute: GetPage(name: '/notfound', page: () => const UnknownRouteScreen()),
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
                    () => const HomeScreen(),
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
                  // Get.toNamed("/home? channel=New Bee&content=Flutter GetX");
                  //to retrieve the value on other page use
                  // Get.parameters['channel']
                  /// `Get.offNamed("/home");` is navigating to the route named "/home" and removing
                  /// all the previous screens from the navigation stack.
                  /// It is equivalent to calling
                  /// `Navigator.pushReplacementNamed(context, "/home")`.
                },
                child: const Text('Home Screen'),
              ),
              Obx(() => Text('Name is ${myController.student.value.name}')),
              TextButton(
                onPressed: () {
                  // if individual var is RX
                  // student.value.name =student.value.name = student.value.name.toUpperCase

                  // for Rx class
                  // student.update((student) {
                  //   student!.name = student.name.toString().toUpperCase();
                  // });

                  // Getx controller Rx Variable
                  // myController.convertToUpperCase();

                  // Getx controller Rx class
                  myController.convertUpperCase();
                  // myController.increment();
                },
                child: const Text('Upper & Increment count'),
              ),

              // Rx state management
              // GetX<MyController>(
              //   // init: MyController(),  //!not neede bcz init globally
              //   builder: (controller) {
              //     return Text('The value is ${myController.count}');
              //   },
              // ),

              // // simple state management
              // GetBuilder<MyController>(
              //   builder: (controller) {
              //     return Text('The value is ${myController.count}');
              //   },
              // ),
              GetBuilder<MyController>(
                // it is better to override inside the class
                // initState: (state) => myController.increment(),
                // dispose: (_) => myController.cleanUpTask(),
                builder: (controller) {
                  return Text('The value of count is: ${controller.count}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
