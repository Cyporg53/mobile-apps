import 'package:flutter/material.dart';

class CaloricGoal extends ChangeNotifier {
  static Map<String, double> inputsMap = {};
  double caloricIntakeBMR = 0;

  void calculateCaloricIntake() {
    var keyset = inputsMap.keys.toSet();
    double heightFeet = 0, heightInches = 0, age = 0, weight = 0, sex = 0;
    for (var key in keyset) {
      if (key == 'heightFeet') {
        heightFeet = inputsMap[key]!;
      }
      if (key == 'heightInches') {
        heightInches = inputsMap[key]!;
      }
      if (key == 'age') {
        age = inputsMap[key]!;
      }
      if (key == 'sex') {
        sex = inputsMap[key]!;
      }
      if (key == 'weight') {
        weight = inputsMap[key]!;
      }
    }

    if (sex == 0) {
      caloricIntakeBMR = 66 +
          (6.23 * weight) +
          (12.7 * (12 * heightFeet + heightInches)) -
          (6.8 * age);
    } else {
      caloricIntakeBMR = 65 +
          (4.35 * weight) +
          (4.7 * (12 * heightFeet + heightInches)) -
          (4.7 * age);
    }
  }
}
