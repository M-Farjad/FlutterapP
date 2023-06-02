import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../APIs/student.dart';

class MyController extends GetxController {
  var student = Student(age: 25, name: 'Farjad').obs;

  // void convertToUpperCase() {
  //   student.name.value = student.name.value.toUpperCase();
  // }
  void convertUpperCase() {
    student.update((student) {
      student!.name = student!.name.toString().toUpperCase();
    });
  }

  // var count = 0.obs;
  // void increment() {
  //   count++;
  // }

  // var count = 0;
  // void increment() {
  //   count++;
  //   update();
  // }

  int count = 0;

  Future<void> increment() async {
    await Future.delayed(const Duration(seconds: 5));
    this.count++;
    update();
  }

  void cleanUpTask() {
    log('cleanUp Called');
  }

  @override
  void onInit() {
    log('Init Called');
    super.onInit();
    increment();
  }

  @override
  void onClose() {
    log('Close Called');
    super.onClose();
  }

  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}
