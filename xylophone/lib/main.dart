import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  int hehe = 1;
  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Widget makeTile(int num, Color color) {
    return Expanded(
      child: RaisedButton(
        color: color,
        onPressed: () {
          playSound(num);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 159, 102, 98),
          title: const Text(
            'Piano from FW',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              makeTile(1, Colors.red),
              makeTile(2, Colors.orange),
              makeTile(3, Colors.yellow),
              makeTile(4, Colors.teal.shade500),
              makeTile(5, Colors.teal.shade900),
              makeTile(6, const Color.fromARGB(255, 0, 0, 255)),
              makeTile(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
