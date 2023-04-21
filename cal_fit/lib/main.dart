// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/signupPage.dart';
import 'screens/loginPage.dart';
import 'screens/home.dart';
import 'screens/profilePage.dart';
import 'widgets/bottomNavbar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  runApp(const MyApp());
}

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => HomePage(),
  '/signup': (BuildContext context) => SignupPage(),
  '/signin': (BuildContext context) => SignInPage(),
  '/dashboard': (BuildContext context) => bottomNavbar(),
  '/profilepage': (BuildContext context) => ProfilePage(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: "/home",
    );
  }
}
