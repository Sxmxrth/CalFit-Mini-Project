// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_field, annotate_overrides
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  late StreamSubscription<StepCount> _subscription;

  void initState() {
    super.initState();
    print("A stream was initialised");
    // Initialize a stream to receive step count updates
    _subscription = Pedometer.stepCountStream.listen(_onStepCount);
  }

  void dispose() {
    super.dispose();
    print("Stream was disposed");
    // Cancel the step count stream subscription
    _subscription.cancel();
  }

  int _stepCount = 0;

  Future<int> _onStepCount(StepCount stepCount) async {
    int count = stepCount.steps;
    print("onStepCount function called");
    setState(() {
      _stepCount = count;
    });
    return _stepCount;
  }

  stepCounterCard(String mainText, IconData iconName, String bottomText) {
    return Column(
      children: [
        Text(
          mainText,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Icon(
          iconName,
          size: 50,
        ),
        SizedBox(
          height: 15,
        ),
        Text(bottomText)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff19376D),
        centerTitle: true,
        title: const Text(
          'Step Counter',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Color(0xffECF2FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,
              startAngle: 180.0,
              radius: 120.0,
              lineWidth: 17.0,
              percent: (_stepCount / 100000),
              progressColor: Color(0xff443C68),
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _stepCount.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("/100000 steps")
                ],
              ),
            ),
            SizedBox(height: 70),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  // color: Color(0xffA5D7E8),
                  ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    stepCounterCard(
                        "Distance", Icons.pin_drop_outlined, "100km"),
                    VerticalDivider(
                      color: Colors.grey[500],
                      thickness: 1,
                    ),
                    stepCounterCard("Speed", Icons.speed_sharp, "3.5km/hr"),
                    VerticalDivider(
                      color: Colors.grey[500],
                      thickness: 1,
                    ),
                    stepCounterCard("Calories",
                        Icons.local_fire_department_outlined, "300/hr"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
