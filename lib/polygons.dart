import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class Polygon extends StatefulWidget {
  @override
  _PolygonState createState() => _PolygonState();
}

class _PolygonState extends State<Polygon> {
  var _sides = 3.0;

  var _radius = 100.0;

  var _radians = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygons'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomPaint(
                painter: ShapePainter(_sides, _radius, _radians),
                child: Container(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Sides'),
            ),
            Slider(
              value: _sides,
              min: 3.0,
              max: 10.0,
              label: _sides.toInt().toString(),
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  _sides = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Size'),
            ),
            Slider(
              value: _radius,
              min: 10.0,
              max: MediaQuery.of(context).size.width / 2,
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Rotation'),
            ),
            Slider(
              value: _radians,
              min: 0.0,
              max: math.pi,
              onChanged: (value) {
                setState(() {
                  _radians = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  ShapePainter(this.sides, this.radius, this.radians);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);

    // startPoint => (100.0,0.0)
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;

      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
