import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final List<Widget> _screens = [
    const Center(child: Text('Mail')),
    const Center(child: Text('Spaces')),
    const Center(child: Text('Meet')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material You')),
      bottomNavigationBar: NavigationBar(
          // indicatorColor: Colors.deepPurple[700],
          height: 60,
          // backgroundColor: Colors.deepPurple[300],
          selectedIndex: index,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.email_outlined),
              selectedIcon: Icon(Icons.email),
              label: 'Mail',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat_bubble),
              label: 'Spaces',
            ),
            NavigationDestination(
              icon: Icon(Icons.videocam_outlined, size: 30),
              selectedIcon: Icon(Icons.videocam, size: 30),
              label: 'Meet',
            ),
          ]),
      body: _screens[index],
    );
  }
}
