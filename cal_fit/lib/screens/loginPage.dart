// ignore_for_file: prefer_const_constructors, unused_field, library_private_types_in_public_api, use_key_in_widget_constructors, sort_child_properties_last

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cal_fit/widgets/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

final Map<String, WidgetBuilder> profileRoutes = {
  '/dashboard': (BuildContext context) => bottomNavbar(),
};

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
            child: DefaultTextStyle(
          child: AnimatedTextKit(totalRepeatCount: 5, animatedTexts: [
            TypewriterAnimatedText(
              "Sign In",
              cursor: "|",
              curve: Curves.bounceIn,
              speed: Duration(milliseconds: 150),
            )
          ]),
          style: TextStyle(
            fontFamily: "SourceSansPro",
            fontSize: 30,
          ),
        )),
        backgroundColor: Color(0xff0B2447),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "animations/signingif.json",
                    height: 275,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            fontFamily: "SourceSansPro"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0B2447),
                        minimumSize: Size(50, 50)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // implement sign-in logic
                      }
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    child: Text('Sign In'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
