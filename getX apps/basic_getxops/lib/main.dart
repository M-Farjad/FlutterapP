import 'dart:developer';

import 'package:basic_getxops/APIs/student.dart';
import 'package:basic_getxops/controllers/id_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'APIs/apis.dart';
import 'APIs/messages.dart';
import 'controllers/async_controller.dart';
import 'controllers/my_controller.dart';
import 'controllers/worker_controller.dart';
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
  IdController idController = Get.put(IdController());
  WorkerController wkrController = Get.put(WorkerController());
  @override
  Widget build(BuildContext context) {
    // My Controller instance will be created even if it is not used
    // tag will be used to find the instance with tag name
    // Controller disposed when it is not used but if permanent is
    // true the instance will be alive throughout the app
    // MyController myController =
    //     Get.put(MyController(), tag: 'instance1', permanent: true);

    // Instance will be created when it is used
    //It is similar to "permanent", the difference is that the instance
    // is discarded when is not being used,
    // but when it's use is needed again, Get will recreate the instance

    Get.putAsync<AsyncController>(() async => AsyncController());
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en', 'US'), //?to get device locale Get.deviceLocale
      fallbackLocale: const Locale('en', 'US'), //?if wrong locale found
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

              //! Rx state management
              // GetX<MyController>(
              //   // init: MyController(),  //!not neede bcz init globally
              //   builder: (controller) {
              //     return Text('The value is ${myController.count}');
              //   },
              // ),

              //! simple state management
              // GetBuilder<MyController>(
              //   builder: (controller) {
              //     return Text('The value is ${myController.count}');
              //   },
              // ),

              //!GetX LifeCycle methods
              // GetBuilder<MyController>(
              //   // it is better to override inside the class
              //   // initState: (state) => myController.increment(),
              //   // dispose: (_) => myController.cleanUpTask(),
              //   builder: (controller) {
              //     return Text('The value of count is: ${controller.count}');
              //   },
              // ),

              //!GetX unique Id
              // GetBuilder<IdController>(
              //   id: 'txtId',
              //   builder: (controller) {
              //     return Text('The value of count is: ${controller.count}');
              //   },
              // ),
              // GetBuilder<IdController>(
              //   builder: (controller) {
              //     return Text('The value of count is: ${controller.count}');
              //   },
              // ),
              // TextButton(
              //   onPressed: () => idController.increment(),
              //   child: const Text('increment'),
              // ),

              //!GetX Workers
              // TextButton(
              //   onPressed: () => wkrController.increment(),
              //   child: const Text('increment'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: TextField(
              //     onChanged: (val) {
              //       wkrController.increment();
              //     },
              //   ),
              // ),

              //!GetX Translations
              // Text('hello'.tr),
              // TextButton(
              //     onPressed: () => myController.changeLanguage('en', 'US'),
              //     child: const Text('English')),
              // TextButton(
              //     onPressed: () => myController.changeLanguage('hi', 'IN'),
              //     child: const Text('Hindi')),
              // TextButton(
              //     onPressed: () => myController.changeLanguage('fr', 'FR'),
              //     child: const Text('French')),
              // TextButton(
              //     onPressed: () => myController.changeLanguage('pk', 'PK'),
              //     child: const Text('Urdu')),

              TextButton(
                  onPressed: () {
                    Get.find<AsyncController>();
                    Get.find<AsyncController>().incrementCounter();
                  },
                  child: const Text('Click Me'))
            ],
          ),
        ),
      ),
    );
  }
}
