import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answers extends StatelessWidget {
  final VoidCallback selectanswer;
  var answer;
  Answers(this.selectanswer,this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
     margin: EdgeInsets.all(10),
     child: ElevatedButton(
              child: Text(answer),
              onPressed: selectanswer,
     )
    );
  }
}
