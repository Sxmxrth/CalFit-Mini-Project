// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_const

import 'package:cal_fit/screens/calories.dart';
import 'package:cal_fit/screens/diet.dart';
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
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Dashboard',
        backgroundColor: Color(0xff0B2447)),
    BottomNavigationBarItem(
        icon: Icon(Icons.fitness_center),
        label: 'Fitness Center',
        backgroundColor: Color(0xff0B2447)),
    BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: 'Calories',
        backgroundColor: Color(0xff0B2447)),
    BottomNavigationBarItem(
        icon: Icon(Icons.food_bank),
        label: 'Diet',
        backgroundColor: Color(0xff0B2447)),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        backgroundColor: Color(0xff0B2447)),
  ];

  final List<Widget> screens = [
    dashboard(),
    fitnessCenter(),
    CalorieCounterPage(),
    Diet(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;

  Widget currentScreen = dashboard();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      currentScreen = screens[_selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) =>
            MaterialPageRoute(builder: (context) => currentScreen),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff0B2447),
        items: bottomNavBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffA5D7E8),
        unselectedIconTheme: IconThemeData(size: 30),
        selectedIconTheme: IconThemeData(size: 35),
        onTap: _onItemTapped,
      ),
    );
  }
}
