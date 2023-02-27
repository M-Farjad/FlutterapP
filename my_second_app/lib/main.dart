// import 'dart:html';
// import 'package:flutter/cupertino.dart';
// import 'dart:math';

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
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Hello! How are you ... ?',
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  // margin: const EdgeInsets.all(20),
                  height: 100,
                  width: 100,

                  color: Colors.red[300],
                  margin: const EdgeInsets.only(left: 20),
                  child: const Image(image: AssetImage('images/songoku.png')),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      // margin: const EdgeInsets.all(20),
                      color: Colors.amber[300],
                      child: const Image(image: AssetImage('images/hero.png')),
                    ),
                    Container(
                      color: Colors.amber[50],
                      height: 100,
                      width: 100,
                      // margin: const EdgeInsets.all(20),
                      child: const Image(image: AssetImage('images/hero.png')),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  width: 100,
                  margin: const EdgeInsets.only(right: 20),
                  color: Colors.blue[300],
                  child: const Image(image: AssetImage('images/hero.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
