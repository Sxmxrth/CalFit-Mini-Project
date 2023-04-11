// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pedometer/pedometer.dart';
// import 'package:sensors_plus/sensors_plus.dart';
import 'dart:io';

// import 'package:sensors_plus/sensors_plus.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  late Stream<int> _stepCountStream;
  int _stepCount = 0;

  @override
  void initState() {
    super.initState();
    _initStepCounter();
  }

  void _initStepCounter() {
    _stepCountStream = Pedometer.stepCountStream as Stream<int>;

    _stepCountStream.listen((stepCount) {
      setState(() {
        _stepCount = stepCount;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Text(
          'Step count: $_stepCount',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
