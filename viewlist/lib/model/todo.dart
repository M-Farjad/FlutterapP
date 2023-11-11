import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Chai', isDone: true),
      ToDo(id: '02', todoText: 'Jodaan', isDone: true),
      ToDo(id: '03', todoText: 'chodaan', isDone: false),
      ToDo(id: '04', todoText: 'gydaan', isDone: false),
      ToDo(id: '05', todoText: 'dojo', isDone: false),
    ];
  }
}
