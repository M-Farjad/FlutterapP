import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(DicePage());
}

class DicePage extends StatefulWidget {
  // const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int points = 1;
  int points2 = 4;
  void set1() {
    setState(() {
      points = Random().nextInt(6) + 1;
    });
  }

  void set2() {
    setState(() {
      points2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Text(
            'Dice',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 22),
          ),
          backgroundColor: Colors.teal[800],
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    set1();
                  },
                  child: Image.asset(
                    'images/dice$points.png',
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    set2();
                  },
                  child: Image.asset(
                    'images/dice$points2.png',
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          backgroundColor: Colors.teal[800],
          label: const Text(
            'Omer tu put chutti kr',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
            ),
          ),
          icon: Icon(Icons.add_a_photo_rounded),
        ),
      ),
    );
  }
}
