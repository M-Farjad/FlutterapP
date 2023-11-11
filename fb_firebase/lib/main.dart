import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook AUTH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map _userObj = {};
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Auth'),
      ),
      body: Column(
        children: [
          Text(_userObj["email"]),
          Text(_userObj["name"]),
        ],
      ),
    );
  }
}
