import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/allcontrollerbindings.dart';
import 'bindings/homeControllerBinding.dart';
import 'bindings/myappcontrollerbinding.dart';
import 'controller/home_controller.dart';
import 'controller/my_controller.dart';
import 'screens/home_screen.dart';
import 'services/service.dart';

Future<void> main() async {
  await initServices();
  await GetStorage.init(); //init storage driver
  MyAppControllerBinding().dependencies();
  runApp(MyApp());
}

Future<void> initServices() async {
  log('Starting Services');
  await Get.putAsync(() async => await Service());
  log('All Services started');
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var storage = GetStorage();

  TextEditingController emailController = TextEditingController();

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
          page: () => const Home(),
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
                child: const Text('increment'),
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
                child: const Text('Home'),
              ),
              //!Get Storage
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: emailController,
                ),
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (GetUtils.isEmail(emailController.text)) {
                            storage.write('email', emailController.text);
                          } else {
                            Get.snackbar(
                                'Error writing', 'email provided was invalid',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        child: const Text('Write')),
                    TextButton(
                        onPressed: () {
                          log('${storage.read('email') ?? 'no email saved'}');
                        },
                        child: const Text('Read')),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
