// // ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_function_type_syntax_for_parameters

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Calories extends StatefulWidget {
//   const Calories({super.key});

//   @override
//   State<Calories> createState() => _CaloriesState();
// }

// final String apiKey = 'tfrgbMHWlLMua08CwmmR8Y83UCrhV6ezK83oK5Qo';
// final String foodItem = '1 Roti';
// final String apiUrl =
//     "https://api.api-ninjas.com/v1/nutrition?query=${foodItem}";
// String nutrients = "";
// fetchNutrients() async {
//   await http
//       .get(Uri.parse(apiUrl), headers: {'X-Api-Key': apiKey}).then((response) {
//     if (response.statusCode == 200) {
//       print(response.body);
//       nutrients = response.body;
//     } else {
//       throw Exception('Failed to load nutrient information');
//     }
//   });
//   return jsonDecode(nutrients);
// }

// class _CaloriesState extends State<Calories> {
//   @override
//   Widget build(BuildContext context) {
//     // fetchNutrients();
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: fetchNutrients(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             }
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//             return Text('Nutrients: ${snapshot.data}');
//           },
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:cal_fit/widgets/circleProgress.dart';
import 'package:flutter/services.dart';

// void main() => runApp(Calorie());

class Calorie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Counter',
      theme: ThemeData(
        // primarySwatch: Colors.indigo.shade900;
        // visualDensity: VisualDensity.adaptivePlatformDensity
        colorSchemeSeed: Colors.indigo.shade900,
      ),
      home: CalorieCounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalorieCounterPage extends StatefulWidget {
  @override
  _CalorieCounterPageState createState() => _CalorieCounterPageState();
}

class _CalorieCounterPageState extends State<CalorieCounterPage>
    with SingleTickerProviderStateMixin {
  int _caloriesConsumed = 0;
  final List<charts.Series<CalorieData, String>> _chartData = [];
  late AnimationController _animationController;
  late Animation<double> _animation;
  final double maxProgress = 1000;
  TextEditingController myController = TextEditingController(text: "0");
  // final _FormField = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animation =
        Tween<double>(begin: 0, end: maxProgress).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _chartData.add(
      charts.Series<CalorieData, String>(
        id: 'calories',
        data: [
          CalorieData('Mon', 0),
          CalorieData('Tue', 0),
          CalorieData('Wed', 0),
          CalorieData('Thu', 0),
          CalorieData('Fri', 0),
          CalorieData('Sat', 0),
          CalorieData('Sun', 0),
        ],
        domainFn: (CalorieData data, _) => data.day,
        measureFn: (CalorieData data, _) => data.calories,
      ),
    );
  }

  void _addCalories(int amount) {
    setState(() {
      _caloriesConsumed += amount;
      final dayIndex = DateTime.now().weekday - 1;
      final todayData = _chartData[0].data[dayIndex];
      _chartData[0].data[dayIndex] = CalorieData(
        todayData.day,
        todayData.calories + amount,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xff0B2447),
        centerTitle: true,
        title: const Text('Calories'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: CustomPaint(
            foregroundPainter: CircleProgress(_animation.value),
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 300,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        if (_animation.value == maxProgress) {
                          _animationController.reverse();
                        } else {
                          _animationController.forward();
                        }
                      },
                      child: Center(
                        child: Text(
                          '${_animation.value.toInt()}',
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      // verticalDirection: VerticalDirection.up,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Calories Consumed: $_caloriesConsumed',
                          style: const TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 150,
                          padding: EdgeInsets.all(16),
                          child: charts.BarChart(
                            _chartData,
                            animate: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Form(
                        // key: _FormField,
                        Column(
                          // verticalDirection: VerticalDirection.down,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 350.0,
                              child: TextFormField(
                                controller: myController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9.]'),
                                  ),
                                  // FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Enter your calorie intake',
                                  border: const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                    vertical: 20.0,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _addCalories(
                                            int.parse(myController.text));
                                        myController.clear();
                                      });
                                    },
                                    icon: const Icon(Icons.clear),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CalorieData {
  final String day;
  final int calories;

  CalorieData(this.day, this.calories);
}
