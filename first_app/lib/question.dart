import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String question;

  Questions(this.question);
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      color: Color.fromRGBO(0, 0, 0, 0.0),
      child: Text(question, selectionColor: Color.fromRGBO(255, 255, 255, 1.0)),
    );
  }
}
