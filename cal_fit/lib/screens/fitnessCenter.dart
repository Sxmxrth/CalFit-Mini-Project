// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:cal_fit/widgets/reusableCard.dart';
import 'package:carousel_slider/carousel_slider.dart';

class fitnessCenter extends StatefulWidget {
  const fitnessCenter({super.key});

  @override
  State<fitnessCenter> createState() => _fitnessCenterState();
}

final List<Widget> containers = [
  CardImageRight(
    image: "images/cardio.png",
    content:
        "5 x 1 min Jumping rope, 10 story stair climbing, 5 x 1 min Jumping Jacks",
    type: "Cardio",
  ),
  CardImageLeft(
    image: "images/core.png",
    content:
        "3 x 1 min Side plank, 4 x 15 Partial Leg Raises, Weighted Russian Twists, Cross legged Mountain Climber",
    type: "Core",
  ),
  CardImageRight(
    image: "images/chest.png",
    content: "4 x 15 Diamond Pushups, 4 x 15 Chest Dips, 3 x 20 Chest Flyes. ",
    type: "Chest",
  ),
  CardImageLeft(
    image: "images/back.png",
    content: "4 x 10 Pull ups, 4 x 10 Chin ups, 4 x 15 Wide Angled Push Ups",
    type: "Back",
  ),
  CardImageRight(
    image: "images/legs.png",
    content:
        "3 x 20 Close legged Squats, 4 x 25 Lunges per leg, 4 x 50 Calf Raises, 3 x 25sec Standing Leg Hold",
    type: "Legs",
  ),
];

bool isExpanded1 = false;
bool isExpanded2 = false;
bool isExpanded3 = false;
bool isExpanded4 = false;
bool isExpanded5 = false;

class _fitnessCenterState extends State<fitnessCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
        automaticallyImplyLeading: false,
        // backgroundColor: Color(0xff19376D),
        title: Text(
          "Hello Samarth!",
          style: TextStyle(
            fontFamily: "SourceSansPro",
            fontSize: 35,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Workouts for you",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "SourceSansPro",
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                        image: AssetImage("images/cardio.avif"),
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
                                        "1) 15 x Burpees",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 4 x 1min Jumping Jacks",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 15 x Squats",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 4 x 1min Skipping",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 4 x 20 Mountain Climber",
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
                            "Cardio",
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
                        image: AssetImage("images/core.avif"),
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
                                        "1) 15 x Burpees",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 2 x 1min planks",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 15 x Squats",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 40 x Russian twists",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 4 x 20 Mountain Climber",
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
                            "Core",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
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
                        image: AssetImage("images/chest.avif"),
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
                                        "1) 15 x Push Ups",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 10 x Chest press",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 15 x Shoulder press",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 4 x pike pushups",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
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
                            "Chest & Shoulder",
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
                        image: AssetImage("images/bicep.avif"),
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
                                        "1) 10 x Pullups",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 10 x Dumbbell rows",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 15 x Bent over rows",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 20 x Bicep curls",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
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
                            "Back & Biceps",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
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
                        image: AssetImage("images/legs.avif"),
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
                                        "1) 15 x Squats",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 6),
                                      Text("2) 15 Lunges",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("3) 15 x Deadlifts",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("4) 20 x Leg press",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text("5) 4 x 20 Calf raises",
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
                            "Legs",
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
              Text(
                "Challenges for you",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "SourceSansPro",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: containers,
                options: CarouselOptions(
                  height: 150,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
