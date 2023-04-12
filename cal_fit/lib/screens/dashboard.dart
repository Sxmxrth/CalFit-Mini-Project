// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_field, annotate_overrides
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Step count: $_stepCount',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
