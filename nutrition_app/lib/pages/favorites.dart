import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_info/food_functions.dart';
import 'data_info/food_data.dart';
import 'food_info.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FoodFunctions>();
    Set<String> favList = appState.favoritesList;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Scaffold(
          appBar: AppBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
            title: const Text(
              'Favorites',
            ),
            backgroundColor: Colors.green.shade100,
            foregroundColor: Colors.green.shade800,
            elevation: 0,
          ),
          body: ListView.builder(
            itemCount: favList.length, // HERE IS TEST FROM ^ABOVE
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                textColor: Colors.black,
                iconColor: Colors.black,
                title: Text(
                  favList.elementAt(index),
                ),
                trailing: IconButton(
                    onPressed: () => setState(() {
                          appState.toggleCalories(favList.elementAt(index));
                        }),
                    icon: Icon(
                        appState.addedFoods.contains(favList.elementAt(index))
                            ? Icons.remove_circle
                            : Icons.add_circle)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodInfoPage(
                              favList.elementAt(index),
                              FoodData.foodWithCalories[
                                  favList.elementAt(index)])));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
