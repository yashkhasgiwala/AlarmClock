import 'package:flutter/material.dart';
import 'dart:math' as math;

class DrawArc extends CustomPainter {
  final double l, t, r, b;
  final Color c;
  final double val;
  DrawArc(this.l, this.t, this.r, this.b, this.c, this.val);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(l, t, r, b);
    final startAngle = -math.pi / 2;
    final sweepAngle = val;
    final useCenter = false;
    Paint brush = new Paint()
      ..color = c
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, brush);
  }

  @override
  bool shouldRepaint(DrawArc oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class DrawCircle extends CustomPainter {
  final double r;
  final PaintingStyle sty;
  DrawCircle(this.r, this.sty);
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = new Paint()
      ..color = Colors.grey[200].withOpacity(.2)
      ..strokeCap = StrokeCap.round
      ..style = sty
      ..strokeWidth = 8;
    canvas.drawCircle(Offset(size.width / 2, size.height / 3), r, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class DrawRect extends CustomPainter {
  final double l, t, r, b;
  DrawRect(this.l, this.t, this.r, this.b);
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = new Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(Rect.fromLTRB(l, t, r, b), brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class DrawLine1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = Colors.grey[500]
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    canvas.translate(size.width / 2, size.height / 3);
    for (int i = 1; i <= 120; i++) {
      canvas.drawLine(Offset(0, -126), Offset(0, -117), line);
      canvas.rotate((2 * math.pi) / 120);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

//Rectangles for my refrence
//          CustomPaint(
//            size: Size(x, y),
//            painter: DrawRect(
//                ((x * .5 - x * .4) + (x * .5 - x * .34)) / 2,
//                ((y / 3 - x * .34) + (y / 3 - x * .4)) / 2,
//                ((x * .5 + x * .4) + (x * .5 + x * .34)) / 2,
//                ((x * .34 + y / 3) + (x * .4 + y / 3)) / 2),
//          ),
//          CustomPaint(
//            size: Size(x, y),
//            painter: DrawRect(
//                ((x * .5 - x * .29) + (x * .5 - x * .332)) / 2,
//                ((y / 3 - x * .332) + (y / 3 - x * .29)) / 2,
//                ((x * .5 + x * .29) + (x * .5 + x * .332)) / 2,
//                ((x * .332 + y / 3) + (x * .29 + y / 3)) / 2),
//          ),
