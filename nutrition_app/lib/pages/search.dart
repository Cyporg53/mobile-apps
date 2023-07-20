import 'package:flutter/material.dart';

import 'data_info/food_data.dart';
import 'food_info.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: AppBar(
                  title: const Text('Search'),
                  backgroundColor: Colors.green.shade100,
                  foregroundColor: Colors.green.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)),
                  elevation: 0,
                  actions: [
                    IconButton(
                        onPressed: () {
                          showSearch(
                              context: context, delegate: MySearchDelegate());
                        },
                        icon: const Icon(Icons.search_outlined)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                    ""), // might be able to remove this chunk later if it can be figured out
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("*calorie count is based on 1 serving size*"),
            )
          ],
        ),
      );
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(query, style: const TextStyle(fontSize: 64)),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions =
        FoodData.foodWithCalories.keys.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FoodInfoPage(query, FoodData.foodWithCalories[query])));
          },
        );
      },
    );
  }
}
