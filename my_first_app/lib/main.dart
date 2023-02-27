import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var ve = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello To Our Landing Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ve++,
        ),
        body: Center(
          child: Text('Hello World Page $ve'),
        ),
      ),
    );
  }
}
