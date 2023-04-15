// ignore_for_file: prefer_const_constructors

import 'package:cal_fit/screens/loginPage.dart';
import 'package:cal_fit/screens/signupPage.dart';
import 'package:cal_fit/widgets/bottomNavbar.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> profileRoutes = {
  '/signup': (BuildContext context) => SignupPage(),
};

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B2447),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "CalFit",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SourceSansPro",
                  color: Color(0xffA5D7E8),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.only(top: 8, bottom: 30),
              child: Text(
                "FIND OUT EXACTLY WHAT DIET & TRAINING WILL WORK SPECIFICALLY FOR YOU",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: "SourceSansPro",
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(300, 65),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                "Next",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Image.asset(
                "images/fitnessModel.png",
                height: 290,
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: bottomNavbar(),
    );
  }
}
