// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:cal_fit/bmiCalculator.dart';
import 'package:cal_fit/screens/dashboard.dart';
import 'package:cal_fit/screens/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:cal_fit/services/firestore_services.dart';

final Map<String, WidgetBuilder> profileRoutes = {
  '/signup': (BuildContext context) => SignupPage(),
  '/dashboard': (BuildContext context) => dashboard(),
};

List<String> options = ["Male", "Female"];
List<String> plan = ["Weight Loss", "Weight Gain"];
var selectedOptions = options[0];

spaceBelow() {
  return SizedBox(
    height: 10,
  );
}

spaceBetween() {
  return SizedBox(
    width: 20,
  );
}

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
var selectedGender = 0;
var selectedProgram = 0;

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double currentSlider = 120.0;
  double targetWeight = 40;
  int currentWeight = 40;
  int currentAge = 14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
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
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
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
                          spaceBelow(),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor1 = 0xff19376D;
                                      buttonColor2 = 0xff576CBC;
                                      selectedGender = 0;
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
                              spaceBetween(),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor2 = 0xff19376D;
                                      buttonColor1 = 0xff576CBC;
                                      selectedGender = 1;
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
                          spaceBelow(),
                          TextFormField(
                            controller: phoneController,
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
                          spaceBelow(),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "HEIGHT",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "SourceSansPro",
                                  ),
                                ),
                                spaceBelow(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      currentSlider.round().toString(),
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "cm",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                spaceBelow(),
                                Slider(
                                  activeColor: Color(0xff576CBC),
                                  value: currentSlider,
                                  max: 210,
                                  label: currentSlider.toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      currentSlider = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          spaceBelow(),
                          spaceBelow(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "WEIGHT",
                                        style: TextStyle(
                                            fontFamily: "SourceSansPro",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      spaceBelow(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            currentWeight.toString(),
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "kg",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor:
                                                    Color(0xff0B2447)),
                                            onPressed: () {
                                              setState(() {
                                                currentWeight--;
                                              });
                                            },
                                            child: Text("-",
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                          spaceBetween(),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor:
                                                    Color(0xff0B2447)),
                                            onPressed: () {
                                              setState(() {
                                                currentWeight++;
                                              });
                                            },
                                            child: Text(
                                              "+",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              spaceBetween(),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "AGE",
                                        style: TextStyle(
                                            fontFamily: "SourceSansPro",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      spaceBelow(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            currentAge.toString(),
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "yrs",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor:
                                                    Color(0xff0B2447)),
                                            onPressed: () {
                                              setState(() {
                                                currentAge--;
                                              });
                                            },
                                            child: Text("-",
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                          spaceBetween(),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                backgroundColor:
                                                    Color(0xff0B2447)),
                                            onPressed: () {
                                              setState(() {
                                                currentAge++;
                                              });
                                            },
                                            child: Text("+",
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          spaceBelow(),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor3 = 0xff19376D;
                                      buttonColor4 = 0xff576CBC;
                                      selectedProgram = 0;
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
                              spaceBetween(),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      buttonColor4 = 0xff19376D;
                                      buttonColor3 = 0xff576CBC;
                                      selectedProgram = 1;
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
                          spaceBelow(),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Target Weight",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "SourceSansPro",
                                  ),
                                ),
                                spaceBelow(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      targetWeight.round().toString(),
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "kg",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                spaceBelow(),
                                Slider(
                                  activeColor: Color(0xff576CBC),
                                  value: targetWeight,
                                  max: 120,
                                  label: currentSlider.toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      targetWeight = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          spaceBelow(),
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
                          spaceBelow(),
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
                          spaceBelow(),
                          ElevatedButton(
                            onPressed: () {
                              bmiCalculator bmi = bmiCalculator(
                                  currentWeight, currentSlider.round());
                              print(int.parse(phoneController.text));
                              AddUser addUser = AddUser(
                                  nameController.text,
                                  options[selectedGender],
                                  int.parse(phoneController.text),
                                  currentSlider.round(),
                                  currentWeight,
                                  currentAge,
                                  plan[selectedProgram],
                                  targetWeight.round(),
                                  selectedMedical,
                                  selectedEmotional,
                                  bmi.calculateBMI());
                              addUser.addUser();
                              Navigator.pushNamed(context, "/dashboard");
                              //Update the database with this info
                            },
                            child: Text("Update"),
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
