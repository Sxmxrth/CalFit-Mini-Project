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
                  height: isExpanded1 ? 190 : 120,
                  child: isExpanded1
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Card 1 expanded",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
                  height: isExpanded2 ? 190 : 120,
                  child: isExpanded2
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Card 2 expanded",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
                  height: isExpanded3 ? 190 : 120,
                  child: isExpanded3
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Card 3 expanded",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
                  height: isExpanded4 ? 190 : 120,
                  child: isExpanded4
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Card 4 expanded",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
                  height: isExpanded5 ? 190 : 120,
                  child: isExpanded5
                      ? Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Card 5 expanded",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
