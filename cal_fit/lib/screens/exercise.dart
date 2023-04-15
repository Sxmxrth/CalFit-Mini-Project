// ignore_for_file: prefer_const_constructors

import 'package:cal_fit/widgets/bottomNavbar.dart';
import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Color(0xff0B2447),
        flexibleSpace: Image(
          image: AssetImage('images/cardio.png'),
          fit: BoxFit.cover,
        ),
        title: Text('My App'),
      ),
    );
  }
}
