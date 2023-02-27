import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestions() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print("Here is answer");
  }

  @override
  Widget build(BuildContext context) {
    var questions = const [
      {
        'questionText': ['What\'s your favorite color?'],
        'answer': ['red', 'green', 'blue', 'white'],
      },
      {
        'questionText': ['What\'s your favorite country?'],
        'answer': ['Pakistan', 'Turkey', 'China', 'England'],
      },
      {
        'questionText': ['What\'s your favorite animal?'],
        'answer': ['Loin', 'Monkey', 'Duck', 'Cato'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: Column(
          children: [
            Questions(questions[questionIndex]['questionText']!.join()),
            ...(questions[questionIndex]['answer'] as List<String>)
                .map((answer) {
              return Answers(answerQuestions, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
