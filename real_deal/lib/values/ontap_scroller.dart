import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

void onTapScroller({required ScrollController scrollController}) {
  final double desiredPosition = Get.height * .2;
  SchedulerBinding.instance.addPostFrameCallback((_) {
    scrollController.animateTo(
      desiredPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  });
}
