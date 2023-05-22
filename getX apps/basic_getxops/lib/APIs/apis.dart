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

  static Future<dynamic> showDialog() {
    return Get.defaultDialog(
      title: 'Button',
      //? titleStyle: to style the title

      /// `middleText` is setting the text that will be displayed in the middle of the
      /// dialog box that will appear when the button is clicked. `middleTextStyle` is
      /// used to set the style of the text in the middle of the dialog box.
      middleText: 'Hello from Button',
      //? middleTextStyle: to style the title
      content: const Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10),
          Expanded(child: Text('Hello from Button')),
        ],
      ),
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      onCancel: () {},
      onConfirm: () {},

      // actions: [] to add mutiple widgets
      //? to customize the buttons
      //? cancel: Widget, confirm: Widget,
      // barrierDismissible: false //!allow barrier to dismiss
    );
  }
}
