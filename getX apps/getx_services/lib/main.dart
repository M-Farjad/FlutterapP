import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/allcontrollerbindings.dart';
import 'bindings/homeControllerBinding.dart';
import 'bindings/myappcontrollerbinding.dart';
import 'controller/home_controller.dart';
import 'controller/my_controller.dart';
import 'screens/home_screen.dart';
import 'services/service.dart';

Future<void> main() async {
  await initServices();
  MyAppControllerBinding().dependencies();
  runApp(const MyApp());
}

Future<void> initServices() async {
  log('Starting Services');
  await Get.putAsync(() async => await Service());
  log('All Services started');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //!All Binding Class
      // initialBinding: AllControllerBinding(),

      //!Separate Bindings classes
      // getPages: [
      //   GetPage(
      //       name: '/home', page: () => Home(), binding: HomeControllerBinding())
      // ],

      //!BindingBuilder
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
          binding: BindingsBuilder(() {
            Get.lazyPut<HomeController>(() => HomeController());
          }),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Services'),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //!Service
              TextButton(
                onPressed: () {
                  Get.find<Service>().incrementCounter();
                },
                child: const Text('Click Me'),
              ),

              //!Bindings
              Obx(
                () => Text(
                  'The value is: ${Get.find<MyController>().count}',
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.find<MyController>().increment();
                },
                child: Text('increment'),
              ),
              //? Move to Home
              TextButton(
                onPressed: () {
                  // Get.to(Home());

                  //?For Named Routes
                  Get.toNamed('/home');

                  //?for normal routes
                  // Get.to(Home(), binding: HomeControllerBinding());
                },
                child: Text('Home'),
              )
            ],
          ),
        )),
      ),
    );
  }
}
