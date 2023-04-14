// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser {
  String name, gender, plan, medical, emotional, email, password;
  int height, weight, age, phone, targetWeight, bmi;

  AddUser(
      this.name,
      this.gender,
      this.phone,
      this.height,
      this.weight,
      this.age,
      this.plan,
      this.targetWeight,
      this.medical,
      this.emotional,
      this.bmi,
      this.email,
      this.password);

  @override
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> addUser() {
    return users
        .add({
          "Name": name,
          "Gender": gender,
          "Phone": phone,
          "Height": height,
          "Weight": weight,
          "Age": age,
          "Plan": plan,
          "TargetWeight": targetWeight,
          "MedicalCondition": medical,
          "EmotionalHealth": emotional,
          "BMI": bmi,
          "Email": email,
          "Password": password
        })
        .then((value) => print("Users added"))
        .catchError((error) => print("failed to add user: $error"));
  }
}

class GetUser {
  String id;
  GetUser(this.id);

  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<String> getUser() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc('id').get();

    final Map<String, dynamic>? data = documentSnapshot.data();
    return data!["Name"];
  }
}
