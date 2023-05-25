// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff19376D),
                Color(0xff576CBC),
              ],
            ),
          ),
        ),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff19376D),
        title: Text(
          "Diets for you",
          style: TextStyle(
            fontFamily: "SourceSansPro",
            fontSize: 35,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded1 = !isExpanded1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue[200],
                      image: DecorationImage(
                        image: AssetImage("images/keto.avif"),
                        fit: BoxFit.cover,
                      )),
                  width: double.infinity,
                  height: isExpanded1 ? 250 : 120,
                  child: isExpanded1
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: double.infinity,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1) 1 Avacado",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 2 Boiled Eggs",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 4 ounce Salmon",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 2 cups leafy greens",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 1 ounce nuts and seeds",
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Keto",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded2 = !isExpanded2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue[200],
                      image: DecorationImage(
                        image: AssetImage("images/paleo.avif"),
                        fit: BoxFit.cover,
                      )),
                  width: double.infinity,
                  height: isExpanded2 ? 250 : 120,
                  child: isExpanded2
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: double.infinity,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1) 4oz Grass-fed beef",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 4oz freerange chicken",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 4oz salmon",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 1 cup Broccoli",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 1oz Almonds",
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Paleo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded3 = !isExpanded3;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue[200],
                      image: DecorationImage(
                        image: AssetImage("images/vegan.avif"),
                        fit: BoxFit.cover,
                      )),
                  width: double.infinity,
                  height: isExpanded3 ? 250 : 120,
                  child: isExpanded3
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: double.infinity,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1) 4oz lean chicken",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 1 cup cottage cheese",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) Non fat Greek Yogurt",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 2 large Eggs",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 2 ts Oatbran",
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Dukan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded4 = !isExpanded4;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue[200],
                      image: DecorationImage(
                        image: AssetImage("images/dukan.avif"),
                        fit: BoxFit.cover,
                      )),
                  width: double.infinity,
                  height: isExpanded4 ? 250 : 120,
                  child: isExpanded4
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: double.infinity,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1) 4oz Tofu",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 1 cup Quinoa",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 1 cup Lentils",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 2 cups Leafy greens",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 1oz Almonds",
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Vegan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded5 = !isExpanded5;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue[200],
                      image: DecorationImage(
                        image: AssetImage("images/atkin.jpg"),
                        fit: BoxFit.cover,
                      )),
                  width: double.infinity,
                  height: isExpanded5 ? 250 : 120,
                  child: isExpanded5
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: double.infinity,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1) 6oz Steak",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 2 large Eggs",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 1 medium sized Avacado",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 2 cups Spinach",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 1oz Cheese",
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Atkin",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
