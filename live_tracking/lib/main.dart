import 'package:flutter/material.dart';
import 'package:live_tracking/constants.dart';
import 'package:live_tracking/live_tracking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youngstr - Google Map Live Tracking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      home: const LiveTrackingPage(),
    );
  }
}
