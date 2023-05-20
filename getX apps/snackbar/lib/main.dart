import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SnackBar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Get.snackbar(
                  'Snack Bar title', 'Snack Bar message',
                  snackPosition: SnackPosition.BOTTOM,
                  animationDuration: Duration(milliseconds: 3000),

                  /// `borderWidth: 4, borderColor: Colors.purple` is setting the width and color of the
                  /// border around the snackbar. In this case, it is setting the border width to 4 and
                  /// They must be used in combined
                  // borderWidth: 4,
                  // borderColor: Colors.deepPurple,

                  backgroundGradient: const LinearGradient(
                    colors: [Colors.red, Colors.deepPurple],
                  ),
                  dismissDirection: DismissDirection.horizontal,
                  isDismissible: true,
                  forwardAnimationCurve: Curves.bounceInOut,
                  icon: const Icon(Icons.close),
                  // shouldIconPulse: false,
                  // leftBarIndicatorColor: Colors.white,
                  mainButton: TextButton(
                    onPressed: () {},
                    child: const Text('Hello'),
                  ),

                  /// `onTap` is a callback function that is triggered when the user taps on the
                  /// snackbar. In this case, it logs a message to the console using the `log`
                  /// function from the `dart:developer` library.
                  onTap: (val) {
                    log('SnackBar message');
                  },
                  showProgressIndicator: true,
                );
              },
              child: const Text('CLink me'),
            )
          ],
        ),
      ),
    );
  }
}
