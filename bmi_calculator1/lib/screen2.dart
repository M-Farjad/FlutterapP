import 'package:flutter/material.dart';
import 'Constants.dart';
import 'BottomButton.dart';

void main() => runApp(MyScreen2());

class MyScreen2 extends StatelessWidget {
  MyScreen2({this.BMIresult, this.BMItext, this.BmiInterpretation});
  String? BMIresult;
  String? BMItext;
  String? BmiInterpretation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF080A1C),
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BMI CalCulator'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 5),
                  child: const Text(
                    'Your Results',
                    style: kLargeTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kInActiveCardColor,
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          BMIresult!,
                          style: kResultTextStyle,
                        ),
                        Text(
                          BMItext!,
                          style: kBMITextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            BmiInterpretation!,
                            textAlign: TextAlign.center,
                            style: kBodyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BottomButton(
                    ButtonTitle: 'RE-CALCULATE',
                    ontap: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
