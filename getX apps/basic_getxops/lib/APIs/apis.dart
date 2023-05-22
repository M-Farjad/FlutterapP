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

  static Future<dynamic> getXBottomSheet() {
    return Get.bottomSheet(
        Wrap(
          children: [
            ListTile(
              leading: const Icon(
                Icons.light_mode_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Light Theme',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.changeTheme(ThemeData.light());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.dark_mode_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Dark Theme',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.changeTheme(ThemeData.dark());
              },
            ),
          ],
        ),
        // /// `barrierColor: Color(0xFFFFFFF)` is setting the color of the barrier that
        /// appears behind the bottom sheet to white. The barrier is the semi-transparent
        /// background that appears behind the bottom sheet and prevents interaction with
        /// the rest of the screen while the bottom sheet is open. By default, the
        /// barrier color is set to a semi-transparent black color, but it can be
        /// customized using the `barrierColor` property. In this case, the color is set
        /// to white, which means that the barrier will be fully opaque and white in
        /// color.
        // barrierColor: Color(0xFFFFFFF),

        /// bottom sheet to deep purple.
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
                width: 2, color: Colors.purple, style: BorderStyle.solid)));
  }
}
