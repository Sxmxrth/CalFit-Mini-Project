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
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    type: "Cardio",
  ),
  CardImageLeft(
    image: "images/core.png",
    content:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    type: "Core",
  ),
  CardImageRight(
    image: "images/chest.png",
    content:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    type: "Chest",
  ),
  CardImageLeft(
    image: "images/back.png",
    content:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    type: "Back",
  ),
  CardImageRight(
    image: "images/legs.png",
    content:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    type: "Legs",
  ),
];

class _fitnessCenterState extends State<fitnessCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff19376D),
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
              CarouselSlider(
                items: containers,
                options: CarouselOptions(
                  height: 150,
                  enlargeCenterPage: true,
                  autoPlay: true,
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
