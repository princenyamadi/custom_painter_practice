import 'dart:math' as math;
import 'package:flutter/material.dart';

class Try extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lines'),
        elevation: 0,
      ),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = 100;
    int sides = 200;

    var path = Path();
    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);

    // startPoint => (100.0,0.0)
    Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;

      path.lineTo(x, y);
    }
    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
