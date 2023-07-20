import 'package:flutter/material.dart';
import 'package:nutrition_app/pages/data_info/food_functions.dart';
import 'package:provider/provider.dart';

import 'data_info/food_data.dart';

// ignore: must_be_immutable
class FoodInfoPage extends StatefulWidget {
  String foodName;
  int? calories;

  FoodInfoPage(this.foodName, this.calories);

  @override
  State<FoodInfoPage> createState() => _FoodInfoPageState();
}

class _FoodInfoPageState extends State<FoodInfoPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FoodFunctions>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Image(
                          image: NetworkImage(
                              FoodData.foodsWithImages[widget.foodName]!))),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_circle_left,
                          color: Colors.lightGreenAccent)),
                ],
              ),
            ),
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
                      child: FractionallySizedBox(
                        child: Text(
                          widget.foodName,
                          style: TextStyle(fontSize: 50, height: 0.8),
                          strutStyle: StrutStyle(height: 5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 30),
                      child: Text(
                        'Calories: ${widget.calories}',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => setState(() {
                  appState.toggleFavorites(widget.foodName);
                }),
                icon: Icon(appState.favoritesList.contains(widget.foodName)
                    ? Icons.favorite
                    : Icons.favorite_border),
              ),
              IconButton(
                  onPressed: () => setState(() {
                        appState.toggleCalories(widget.foodName);
                      }),
                  icon: Icon(appState.addedFoods.contains(widget.foodName)
                      ? Icons.remove_circle
                      : Icons.add_circle)),
            ]),
          ],
        ),
      ),
    );
  }
}
