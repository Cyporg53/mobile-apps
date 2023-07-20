import 'package:flutter/material.dart';
import 'package:nutrition_app/pages/data_info/food_data.dart';

class FoodFunctions extends ChangeNotifier {
  Set<String> favoritesList = <String>{};

  void toggleFavorites(String foodName) {
    if (favoritesList.contains(foodName)) {
      favoritesList.remove(foodName);
    } else {
      favoritesList.add(foodName);
    }
    notifyListeners();
    // print(favoritesList); TESTING FAVORITES_LIST CONTENTS
  }

  List<String> addedFoods = [];
  int totalCalories = 0;

  void toggleCalories(String foodName) {
    if (addedFoods.contains(foodName)) {
      addedFoods.remove(foodName);
      totalCalories -= FoodData.foodWithCalories[foodName]!;
    } else {
      addedFoods.add(foodName);
      totalCalories += FoodData.foodWithCalories[foodName]!;
    }
    notifyListeners();
    // print(totalCalories); TESTING ADDED_LIST QUANTITY
  }
}
