import 'package:flutter/material.dart';

class CustomShadows {
  CustomShadows._();
  static List<BoxShadow>? shadows = const [
    BoxShadow(
      color: Color(0x4C000000),
      blurRadius: 8,
      offset: Offset(0, 2),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow>? shadowsAbove = const [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 20,
      offset: Offset(0, -5),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow>? shadowsAll = const [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 8,
      offset: Offset(0, 3),
      spreadRadius: 2,
    )
  ];
  static List<BoxShadow>? shadowsNotTop = const [
    BoxShadow(
      color: Color(0x11000000),
      blurRadius: 5,
      offset: Offset(0, 3),
      spreadRadius: 2,
    )
  ];
}
