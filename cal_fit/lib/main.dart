// ignore_for_file: prefer_const_constructors

import 'package:cal_fit/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/signupPage.dart';
import 'pages/loginPage.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
