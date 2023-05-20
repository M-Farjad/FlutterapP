import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'APIs/apis.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // APIs.showSnackBar();
                  Get.defaultDialog(
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
                      barrierDismissible: false //!allow barrier to dismiss
                      );
                },
                child: const Text('Click me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
