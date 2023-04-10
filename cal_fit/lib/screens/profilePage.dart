// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:cal_fit/screens/signupPage.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> profileRoutes = {
  '/signup': (BuildContext context) => SignupPage(),
};

List<String> options = ["Male", "Female"];
var selectedOptions = options[0];

List<String> medicalCondition = [
  "None",
  "Diabetes",
  "Pre Diabetes",
  "Cholestrol",
  "Hypertension",
  "PCOS",
  "Thyroid",
  "Physical Injury"
];

List<String> emotionalHealth = [
  "None",
  "Excessive stress",
  "Sleep issues",
  "Depression",
  "Anger Issues",
  "Lonliness"
];

var selectedMedical = medicalCondition.first;
var selectedEmotional = emotionalHealth.first;

var buttonColor1 = 0xff576CBC;
var buttonColor2 = 0xff576CBC;
var buttonColor3 = 0xff576CBC;
var buttonColor4 = 0xff576CBC;
var selectedGender = 1;
var selectedProgram = 1;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(4, 10, 0, 0),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Do something when the left icon button is pressed
            },
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Edit Profile'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Logout'),
                  value: 2,
                ),
              ];
            },
            onSelected: (value) {
              // Do something when an option is selected
              switch (value) {
                case 1:
                  // Do something for option 1
                  break;
                case 2:
                  Navigator.pushNamed(context, '/signup');
                  // Do something for option 2
                  break;
                case 3:
                  // Do something for option 3
                  break;
              }
            },
          ),
        ],
        backgroundColor: Color(0xff0B2447),
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text('Your Profile', style: TextStyle(fontSize: 25)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 25),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Center(
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('images/fitnessModel.png'),
                  ),
                ),
              ),
              Text(
                'First Last',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro'),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Name",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              value!.isEmpty
                                  ? "please enter your name"
                                  : "null";
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor1 = 0xff19376D;
                                      buttonColor2 = 0xff576CBC;
                                      selectedGender = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(buttonColor1),
                                  ),
                                  child: Text(
                                    'Male',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor2 = 0xff19376D;
                                      buttonColor1 = 0xff576CBC;
                                      selectedGender = 2;
                                    });
                                  },
                                  onLongPress: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(buttonColor2),
                                  ),
                                  child: Text(
                                    'Female',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Phone",
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              value!.isEmpty
                                  ? "please enter your phone number"
                                  : "null";
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Age",
                                prefixIcon: Icon(Icons.people),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              value!.isEmpty ? "please enter your age" : "null";
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Weight",
                                prefixIcon: Icon(Icons.monitor_weight),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              value!.isEmpty
                                  ? "please enter your Weight"
                                  : "null";
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Height",
                                prefixIcon: Icon(Icons.height),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              value!.isEmpty
                                  ? "please enter your Height"
                                  : "null";
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor3 = 0xff19376D;
                                      buttonColor4 = 0xff576CBC;
                                      selectedProgram = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(buttonColor3),
                                  ),
                                  child: Text(
                                    'Weight Loss',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor4 = 0xff19376D;
                                      buttonColor3 = 0xff576CBC;
                                      selectedProgram = 2;
                                    });
                                  },
                                  onLongPress: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(buttonColor4),
                                  ),
                                  child: Text(
                                    'Weight Gain',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Target Weight",
                                prefixIcon: Icon(Icons.pin_end),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              value!.isEmpty
                                  ? "please enter your Target Weight"
                                  : "null";
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Medical Condition : ",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              DropdownButton(
                                value: selectedMedical,
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    selectedMedical = value!;
                                  });
                                },
                                items: medicalCondition
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Emotional Health : ",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              DropdownButton(
                                value: selectedEmotional,
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    selectedEmotional = value!;
                                  });
                                },
                                items: emotionalHealth
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              //Update the database with this info
                            },
                            child: Text("Submit"),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 40),
                                backgroundColor: Color(0xff0B2447)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
