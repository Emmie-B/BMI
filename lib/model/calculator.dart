import 'dart:math';

import 'package:flutter/material.dart';

class Calculation {
  double? height, weight;
  Calculation({this.height, this.weight, this.bmi});
  double? bmi;

  String checkBmi() {
    bmi = weight! / pow(height! / 100, 2);
    return bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi! >= 30) {
      return "Obesity";
    } else if (bmi! > 25) {
      return "Overweight";
    } else if (bmi! > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (bmi! >= 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi! > 25) {
      return 'You need to excercise more and cut off junk foods.';
    } else if (bmi! > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  Color getResultColor() {
    if (bmi! >= 30) {
      return Color.fromARGB(255, 216, 63, 36);
    } else if (bmi! > 25) {
      return Color.fromARGB(255, 238, 204, 9);
    } else if (bmi! > 18.5) {
      return Color.fromARGB(255, 36, 216, 118);
    } else {
      return Color.fromARGB(255, 19, 65, 190);
    }
  }
}
