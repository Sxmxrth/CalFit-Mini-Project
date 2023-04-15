// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:cal_fit/screens/profilePage.dart';
import 'package:cal_fit/screens/dashboard.dart';
import 'package:cal_fit/screens/fitnessCenter.dart';

// final Map<String, WidgetBuilder> profileRoutes = {
//   '/profilepage': (BuildContext context) => ProfilePage(),
// };

class bottomNavbar extends StatefulWidget {
  const bottomNavbar({super.key});

  @override
  State<bottomNavbar> createState() => _bottomNavbarState();
}

class _bottomNavbarState extends State<bottomNavbar> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    dashboard(),
    fitnessCenter(),
    // Text(
    //   'Index 1: Fitness Center',
    //   style: optionStyle,
    // ),
    Text(
      'Index 2: Calorie',
      style: optionStyle,
    ),
    Text(
      'Index 3: Diet Options',
      style: optionStyle,
    ),
    // Text(
    //   'Index 4: Profile Page',
    //   style: optionStyle,
    // ),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Color(0xff19376D),
        child: const Icon(Icons.chat_bubble),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Color(0xff0B2447),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
            backgroundColor: Color(0xff0B2447),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 40,
            ),
            label: 'Calories',
            backgroundColor: Color(0xff0B2447),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Diet',
            backgroundColor: Color(0xff0B2447),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xff0B2447),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffA5D7E8),
        unselectedIconTheme: IconThemeData(size: 30),
        selectedIconTheme: IconThemeData(size: 35),
        onTap: _onItemTapped,
      ),
    );
  }
}
