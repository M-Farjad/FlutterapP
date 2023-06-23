import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.back),
        centerTitle: true,
        elevation: 0,
        title: const Text('Your Orders'),
      ),
    );
  }
}
