import 'package:flutter/material.dart';
import 'package:nutrition_app/pages/caloric_goal.dart';
import 'package:provider/provider.dart';

import 'data_info/food_data.dart';
import 'data_info/food_functions.dart';
import 'food_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FoodFunctions>();
    var goalState = context.watch<CaloricGoal>();
    var textController1 = TextEditingController();
    var textController2 = TextEditingController();
    var textController3 = TextEditingController();
    var textController4 = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green.shade800,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${appState.totalCalories}',
                      style: TextStyle(fontSize: 70, color: Colors.white),
                    ),
                    Text(
                      '/ ${goalState.caloricIntakeBMR.toInt()}',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )
                  ],
                ),
                Text(
                  'CALORIES CONSUMED',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GoalText('Height:'),
                            GoalInputBox(textController1, 'heightFeet'),
                            GoalText('ft.'),
                            GoalInputBox(textController2, 'heightInches'),
                            GoalText('in.')
                          ],
                        ),
                        Row(
                          children: [
                            GoalText('Weight:'),
                            GoalInputBox(textController3, 'weight'),
                            GoalText('lbs')
                          ],
                        ),
                        Row(
                          children: [
                            GoalText('Age:'),
                            GoalInputBox(textController4, 'age'),
                            GoalText('years')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GoalText('Sex:'),
                                SexDropDown(),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            elevation: MaterialStateProperty
                                                .resolveWith<double>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.disabled)) {
                                                  return 0;
                                                }
                                                return 0;
                                              },
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.disabled)) {
                                                  return Colors.blue.shade600;
                                                }
                                                return Colors.blue.shade600;
                                              },
                                            ),
                                          ),
                                          onPressed: () => setState(() {
                                                appState.addedFoods.clear();
                                                appState.totalCalories = 0;
                                                CaloricGoal.inputsMap.clear();
                                              }),
                                          child: Text('RESET FOOD')),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            elevation: MaterialStateProperty
                                                .resolveWith<double>(
                                              // As you said you dont need elevation. I'm returning 0 in both case
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.disabled)) {
                                                  return 0;
                                                }
                                                return 0; // Defer to the widget's default.
                                              },
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.disabled)) {
                                                  return Colors.black;
                                                }
                                                return Colors
                                                    .black; // Defer to the widget's default.
                                              },
                                            ),
                                          ),
                                          onPressed: () => setState(() {
                                                goalState
                                                    .calculateCaloricIntake();
                                              }),
                                          child: Text('CALCULATE BMR')),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        color: Colors.green.shade100,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15),
                              child: Text(
                                'FOOD ITEMS ADDED',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                //scrollDirection: Axis.vertical,
                                itemCount: appState.addedFoods.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      appState.addedFoods.elementAt(index),
                                    ),
                                    trailing: Text(
                                      '${FoodData.foodWithCalories[appState.addedFoods.elementAt(index)]} cals',
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FoodInfoPage(
                                                      appState.addedFoods
                                                          .elementAt(index),
                                                      FoodData.foodWithCalories[
                                                          appState.addedFoods
                                                              .elementAt(
                                                                  index)])));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class GoalInputBox extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  String _inputType = '';

  GoalInputBox(TextEditingController controller, String inputType) {
    _controller = controller;
    _inputType = inputType;
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: 85,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) => {
              if (value.isEmpty)
                {
                  CaloricGoal.inputsMap[_inputType] = 0,
                }
              else
                {CaloricGoal.inputsMap[_inputType] = double.parse(value)},
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class GoalText extends StatelessWidget {
  final String label;
  GoalText(this.label);
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}

class SexDropDown extends StatefulWidget {
  @override
  State<SexDropDown> createState() => _SexDropDownState();
}

class _SexDropDownState extends State<SexDropDown> {
  List<String> sexes = ['Male', 'Female'];
  String? selectedSex = 'Male';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: 150,
        child: DropdownButton<String>(
          value: selectedSex,
          items: sexes
              .map((sex) =>
                  DropdownMenuItem<String>(value: sex, child: Text(sex)))
              .toList(),
          onChanged: (sex) => {
            setState(
              () => selectedSex = sex,
            ),
            sex == 'Male'
                ? CaloricGoal.inputsMap['sex'] = 0
                : CaloricGoal.inputsMap['sex'] = 1,
          },
        ),
      ),
    );
  }
}
