// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

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
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Steps',
      style: optionStyle,
    ),
    Text(
      'Index 2: Fitness Center',
      style: optionStyle,
    ),
    Text(
      'Index 3: Diet Options',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profile Page',
      style: optionStyle,
    ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff0B2447),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Steps',
            backgroundColor: Color(0xff0B2447),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
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
        onTap: _onItemTapped,
      ),
    );
  }
}
