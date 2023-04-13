// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  String name, gender, plan, medical, emotional;
  int height, weight, age, phone, targetWeight;

  AddUser(this.name, this.gender, this.phone, this.height, this.weight,
      this.age, this.plan, this.targetWeight, this.medical, this.emotional);

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
          "EmotionalHealth": emotional
        })
        .then((value) => print("Users added"))
        .catchError((error) => print("failed to add user: $error"));
  }
}
