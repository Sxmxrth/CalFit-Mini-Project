// ignore_for_file: prefer_const_constructors, unused_field, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:async';
import 'package:cal_fit/widgets/bottomNavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cal_fit/screens/loginPage.dart';
import 'package:cal_fit/screens/profilePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cal_fit/services/firestore_services.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

final Map<String, WidgetBuilder> profileRoutes = {
  '/signin': (BuildContext context) => SignInPage(),
  '/dashboard': (BuildContext context) => bottomNavbar(),
  '/profilepage': (BuildContext context) => ProfilePage(),
};

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailControlller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleSignUp(BuildContext context, String name) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailControlller.text, password: passwordController.text);
    User? user = userCredential.user;

    FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'Name': name,
      'Email': emailControlller.text,
      "Gender": "",
      "Phone": 0,
      "Height": 0,
      "Weight": 0,
      "Age": 0,
      "Plan": "",
      "TargetWeight": 0,
      "MedicalCondition": "",
      "EmotionalHealth": "",
      "BMI": 0,
    });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ProfilePage(uid: user!.uid),
    //   ),
    // );

    Navigator.pushNamed(context, "/dashboard");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(
            'Signup',
            style: TextStyle(
              fontFamily: "SourceSansPro",
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Color(0xff0B2447),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      "images/gym1.png",
                      height: 200,
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: emailControlller,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
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
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0B2447),
                        minimumSize: Size(200, 50)),
                    child: Text('Sign Up'),
                    onPressed: () {
                      handleSignUp(context, nameController.text);
                      // AddUser addUser = AddUser(
                      //     nameController.text,
                      //     "",
                      //     0,
                      //     0,
                      //     0,
                      //     0,
                      //     "",
                      //     0,
                      //     "",
                      //     "",
                      //     0,
                      //     emailControlller.text,
                      //     passwordController.text);
                      // addUser.addUser().then((DocumentReference doc) {
                      //       ProfilePage(doc.id);
                      //     } as FutureOr Function(void value));

                      if (_formKey.currentState!.validate()) {
                        //calls the validator function
                        _formKey.currentState!
                            .save(); //calls the onSaved function
                        // Do something with the form data
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/signin");
                        },
                        child: Text(
                          "Already have an account? Sign in",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
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
