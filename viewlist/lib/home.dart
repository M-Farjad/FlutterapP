import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:viewlist/Todo_item.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = ToDo.todoList();
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.pinkAccent,
      elevation: 0,
      title: Row(
        children: const [
          Icon(
            Icons.menu,
            color: Colors.pinkAccent,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget searchbox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 2.5),
          prefixIcon: Icon(Icons.search, color: Colors.pinkAccent, size: 22),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          focusColor: Colors.grey,
          hintStyle: TextStyle(color: Colors.pinkAccent, fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchbox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: const Text(
                        'All To Dos',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    for (ToDo todoo in todoslist)
                      Todoitem(
                        todo: todoo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: () {},
                      ),
                    const VerticalDivider(
                      indent: 40,
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
