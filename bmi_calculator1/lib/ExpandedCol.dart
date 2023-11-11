import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GenderCard.dart';
import 'Constants.dart';

enum Gender { Male, Female }

class ExpandedColumns extends StatefulWidget {
  const ExpandedColumns({Key? key}) : super(key: key);

  @override
  State<ExpandedColumns> createState() => _ExpandedColumnsState();
}

class _ExpandedColumnsState extends State<ExpandedColumns> {
  // Color maleCardColor = inActiveCardColor;
  // Color femaleCardColor = inActiveCardColor;
  // void updateColor(Gender gender) {
  //   if (gender == Gender.Male) {
  //     if (maleCardColor == inActiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inActiveCardColor;
  //     }
  //     // else {
  //     //   maleCardColor = inActiveCardColor;
  //     //   femaleCardColor = activeCardColor;
  //     // }
  //   } else if (gender == Gender.Female) {
  //     if (femaleCardColor == inActiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inActiveCardColor;
  //     }
  //     // else {
  //     //   femaleCardColor = inActiveCardColor;
  //     //   maleCardColor = activeCardColor;
  //     // }
  //   }
  // }

  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
            child: ReusableCard(
              onpress: () {
                setState(() {
                  selectedGender = Gender.Male;
                });
              },
              colour: (selectedGender == Gender.Male)
                  ? kActiveCardColor
                  : kInActiveCardColor,
              category: GenderCard(
                category: 'MALE',
                icon: FontAwesomeIcons.mars,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onpress: () {
                setState(() {
                  selectedGender = Gender.Female;
                });
              },
              colour: (selectedGender == Gender.Female)
                  ? kActiveCardColor
                  : kInActiveCardColor,
              category:
                  GenderCard(category: 'FEMALE', icon: FontAwesomeIcons.venus),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandedColumns1 extends StatefulWidget {
  @override
  State<ExpandedColumns1> createState() => _ExpandedColumns1State();
}

class _ExpandedColumns1State extends State<ExpandedColumns1> {
  int weight = 40;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    style: TextStyle(fontSize: 20, color: kLightTextColor),
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
                    style: TextStyle(fontSize: 20, color: kLightTextColor),
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
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final Function onPressed;
  RoundIconButton({Key? key, this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kbottomcolor,
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      shape: const CircleBorder(),
      child: Icon(icon),
      onPressed: () {
        onPressed;
      },
    );
  }
}
