import 'package:flutter/material.dart';
class CrossPainter extends CustomPainter {
  Paint _paint;

  CrossPainter() {
    _paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0.0, 0.0), Offset(500.0, 0.0), _paint);

    //canvas.drawLine(
        //Offset(size.width, 0.0), Offset(0.0, size.height), _paint);
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) {
    return false;
  }
}