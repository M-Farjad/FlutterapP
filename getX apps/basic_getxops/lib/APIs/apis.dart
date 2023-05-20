import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APIs {
  static SnackbarController showSnackBar() {
    return Get.snackbar(
      'Snack Bar title', 'Snack Bar message',
      snackPosition: SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 3000),

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
      // forwardAnimationCurve: Curves.bounceInOut,
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
  }
}
