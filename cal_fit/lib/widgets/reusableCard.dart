// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable
import 'package:flutter/material.dart';

class CardImageRight extends StatelessWidget {
  String image, content, type;
  CardImageRight(
      {required this.image, required this.content, required this.type});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 5),
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff0A4D68),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  image,
                  height: 130,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class CardImageLeft extends StatelessWidget {
  String image, content, type;
  CardImageLeft(
      {required this.image, required this.content, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff088395),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff576CBC),
                Color(0xffA5D7E8),
              ],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Image.asset(
                image,
                height: 150,
              ),
            ),
            Container(
              width: 150,
              height: 150,
              child: Text(
                content,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
