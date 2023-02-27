import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Just Throw a Dice ...',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 44),
          ),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}
