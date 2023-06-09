// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_function_type_syntax_for_parameters, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Calorie extends StatefulWidget {
  @override
  State<Calorie> createState() => _CalorieState();
}

class _CalorieState extends State<Calorie>
    with AutomaticKeepAliveClientMixin<Calorie> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CalorieCounterPage();
  }
}

class CalorieCounterPage extends StatefulWidget {
  @override
  _CalorieCounterPageState createState() => _CalorieCounterPageState();
}

class _CalorieCounterPageState extends State<CalorieCounterPage>
    with AutomaticKeepAliveClientMixin<CalorieCounterPage> {
  final List<charts.Series<CalorieData, String>> _chartData = [];
  @override
  void initState() {
    super.initState();
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

  TextEditingController caloriesController = TextEditingController(text: "0");
  double caloriesBurnt = 0;
  double maxCalories = 10000;

  void updateCaloriesBurnt(String foodItem) async {
    final String apiKey = 'tfrgbMHWlLMua08CwmmR8Y83UCrhV6ezK83oK5Qo';
    final String apiUrl =
        "https://api.api-ninjas.com/v1/nutrition?query=${foodItem}";
    String nutrients = "";
    http.Response response =
        await http.get(Uri.parse(apiUrl), headers: {'X-Api-Key': apiKey});
    if (response.statusCode == 200) {
      nutrients = response.body;
      print((jsonDecode(nutrients))[0]["calories"]);
      setState(() {
        caloriesBurnt += jsonDecode(nutrients)[0]["calories"];
        final dayIndex = DateTime.now().weekday - 1;
        final todayData = _chartData[0].data[dayIndex];
        _chartData[0].data[dayIndex] = CalorieData(
          todayData.day,
          todayData.calories + caloriesBurnt.toInt(),
        );
      });
    } else {
      throw Exception('Failed to load nutrient information');
    }
  }

  @override
  bool get wantKeepAlive => true;
  Map<dynamic, dynamic> calorie = {};
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff19376D),
                Color(0xff576CBC),
              ],
            ),
          ),
        ),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff19376D),
        title: const Text(
          "Calorie Counter",
          style: TextStyle(
            fontFamily: "SourceSansPro",
            fontSize: 35,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: CustomPaint(
            child: Column(
              children: [
                CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  startAngle: 180.0,
                  radius: 110.0,
                  lineWidth: 17.0,
                  percent: caloriesBurnt / maxCalories, // Updated value
                  center: Text(
                    (caloriesBurnt).toStringAsFixed(0),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  // progressColor: Color(0xff980F5A),
                  linearGradient: LinearGradient(
                    colors: [
                      Color(0xff37306B),
                      Color(0xffD27685),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Calories Consumed: ${caloriesBurnt.toInt()}',
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 350.0,
                              child: TextFormField(
                                controller: caloriesController,
                                decoration: InputDecoration(
                                  hintText: 'Enter the food item',
                                  border: const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                    vertical: 20.0,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateCaloriesBurnt(
                                            caloriesController.text);
                                        caloriesController.clear();
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
