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
                  // APIs.showDialog();
                  APIs.getXBottomSheet();
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
