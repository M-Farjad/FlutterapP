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
}
