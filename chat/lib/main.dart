import 'dart:developer';

import 'package:chat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late Size mq;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //?Enter Full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //!For setting orientation to portriat only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventuAlly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: ,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.grey),
          elevation: 1,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 19),
          backgroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}