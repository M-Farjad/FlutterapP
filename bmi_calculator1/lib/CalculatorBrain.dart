import 'dart:math';

class CalculatorBrain {
  late int? height;
  late int? weight;
  double? _BMI;
  CalculatorBrain({this.height, this.weight});

  String? CalculateBMI() {
    _BMI = (weight! / pow(height! / 100, 2));
    print(_BMI!);
    print(height);
    print(weight);

    return _BMI?.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI! > 25) {
      return 'OverWeight';
    } else if (_BMI! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_BMI! > 25) {
      return 'You have a higher than normal body weight. Try to exercise More.';
    } else if (_BMI! > 18.5) {
      return 'You have a Normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. Try to eat More.';
    }
  }
}
