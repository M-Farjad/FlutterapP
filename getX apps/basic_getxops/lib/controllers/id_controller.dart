import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../APIs/student.dart';

class IdController extends GetxController {
  int count = 0;

  void increment() async {
    count++;
    update(['txtId']);
  }
}
