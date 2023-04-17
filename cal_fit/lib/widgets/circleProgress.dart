// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  final strokeCircle = 20.0;
  double currentProgress;
  CircleProgress(this.currentProgress);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 4);
    double radius = 100;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = 10
      ..color = Color(0xff1C82AD)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / 1000);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
