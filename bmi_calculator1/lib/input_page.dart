import 'dart:html';
import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screen2.dart';
import 'ReusableCard.dart';
import 'ExpandedCol.dart';
import 'package:flutter/material.dart';
import 'BottomButton.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          // style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ExpandedColumns(),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      category: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Height',
                            style:
                                TextStyle(fontSize: 30, color: kLightTextColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kHeightTextStyle,
                              ),
                              const Text(
                                'cm',
                                style: kLightTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: kbottomcolor,
                              activeTrackColor: kwhite,
                              inactiveTrackColor: kLightTextColor,
                              overlayColor: Color(0x29EB1555),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              max: 220,
                              min: 120,
                              onChanged: (double NewValue) {
                                setState(() {
                                  height = NewValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      colour: Color(0xFF1D1E33),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kCardColor,
                      category: Column(
                        children: [
                          const Text(
                            'Weight',
                            style:
                                TextStyle(fontSize: 20, color: kLightTextColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w900),
                              ),
                              const Text(
                                'kg',
                                style: kLightTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      //  Column(
                      //   children: [
                      //     Text(
                      //       'Weight',
                      //       style: TextStyle(fontSize: 20, color: kLightTextColor),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.baseline,
                      //       textBaseline: TextBaseline.alphabetic,
                      //       children: [
                      //         Text(
                      //           weight.toString(),
                      //           style: TextStyle(
                      //               fontSize: 40, fontWeight: FontWeight.w900),
                      //         ),
                      //         Text(
                      //           'kg',
                      //           style: kLightTextStyle,
                      //         ),
                      //       ],
                      //     ),
                      //     SliderTheme(
                      //       data: SliderTheme.of(context).copyWith(
                      //         thumbColor: kbottomcolor,
                      //         activeTrackColor: kwhite,
                      //         inactiveTrackColor: kLightTextColor,
                      //         overlayColor: Color(0x29EB1555),
                      //       ),
                      //       child: Slider(
                      //         value: weight.toDouble(),
                      //         max: 80,
                      //         min: 20,
                      //         onChanged: (double NewValue) {
                      //           setState(() {
                      //             weight = NewValue.round();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kCardColor,
                      category: Column(
                        children: [
                          const Text(
                            'AGE',
                            style:
                                TextStyle(fontSize: 20, color: kLightTextColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w900),
                              ),
                              // Text(
                              //   'years',
                              //   style: kLightTextStyle,
                              // ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      //  Column(
                      //   children: [
                      //     Text(
                      //       'Weight',
                      //       style: TextStyle(fontSize: 20, color: kLightTextColor),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.baseline,
                      //       textBaseline: TextBaseline.alphabetic,
                      //       children: [
                      //         Text(
                      //           weight.toString(),
                      //           style: TextStyle(
                      //               fontSize: 40, fontWeight: FontWeight.w900),
                      //         ),
                      //         Text(
                      //           'kg',
                      //           style: kLightTextStyle,
                      //         ),
                      //       ],
                      //     ),
                      //     SliderTheme(
                      //       data: SliderTheme.of(context).copyWith(
                      //         thumbColor: kbottomcolor,
                      //         activeTrackColor: kwhite,
                      //         inactiveTrackColor: kLightTextColor,
                      //         overlayColor: Color(0x29EB1555),
                      //       ),
                      //       child: Slider(
                      //         value: weight.toDouble(),
                      //         max: 80,
                      //         min: 20,
                      //         onChanged: (double NewValue) {
                      //           setState(() {
                      //             weight = NewValue.round();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                  ButtonTitle: 'CALCULATE',
                  ontap: () {
                    CalculatorBrain obj =
                        CalculatorBrain(height: height, weight: weight);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyScreen2(
                        BMItext: obj.CalculateBMI(),
                        BMIresult: obj.getResult(),
                        BmiInterpretation: obj.getInterpretation(),
                      );
                    }));
                  }),
            )
          ],
        ),
      ),

      // Container(
      //   color: Theme.of(context).scaffoldBackgroundColor,
      //   child: Center(
      //     child: Builder(
      //       builder: (BuildContext context) {
      //         return Container(
      //           // width: double.infinity,
      //           // height: double.infinity,
      //           height: 100,
      //           width: 100,

      //           child: Center(
      //             child: Text('Helloo',
      //                 style: Theme.of(context).textTheme.bodyText1),
      //           ),
      //           color: Color.fromARGB(255, 0, 0, 0),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child:
      //       // Theme(
      //       // data: ThemeData(
      //       //     iconTheme:
      //       //         IconThemeData(color: Colors.white, opacity: double.infinity),
      //       //     colorScheme: Theme.of(context).colorScheme),
      //       // child:
      //       Icon(
      //     Icons.add,
      //   ),
      // ),
      // ),
    );
  }
}
