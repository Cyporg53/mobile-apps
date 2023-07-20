import 'package:flutter/material.dart';
import 'package:nutrition_app/pages/caloric_goal.dart';
import 'package:nutrition_app/pages/data_info/food_functions.dart';

import 'package:provider/provider.dart';
import 'nav_bar.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FoodFunctions()),
    ChangeNotifierProvider(create: (context) => CaloricGoal()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cal-urry', // CHANGE PLEASE
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}
