import 'package:flutter/material.dart';
import 'shapes.dart';
import 'dart:async';
import 'dart:math' as math;

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin {
  Animation<double> animationM, animationH;
  AnimationController controller;
  Tween<double> rotationM =
      Tween(begin: 0, end: math.pi * 6 * DateTime.now().minute / 180);
  Tween<double> rotationH = Tween(
      begin: 0,
      end: DateTime.now().hour <= 12
          ? 30 * DateTime.now().hour * math.pi / 180
          : 30 * (DateTime.now().hour - 12) * math.pi / 180);
  double minute = math.pi * 6 * DateTime.now().minute / 180;
  double hour = DateTime.now().hour <= 12
      ? 30 * DateTime.now().hour * math.pi / 180
      : 30 * (DateTime.now().hour - 12) * math.pi / 180;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animationM = rotationM.animate(controller);
    animationH = rotationH.animate(controller)
      ..addListener(() {
        if (!mounted) return;
        setState(() {
          minute = animationM.value;
          hour = animationH.value;
        });
      });

    controller.forward();

    Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getTime() {
    if (mounted) {
      setState(() {
        minute = math.pi * 6 * DateTime.now().minute / 180;
        hour = DateTime.now().hour <= 12
            ? 30 * DateTime.now().hour * math.pi / 180
            : 30 * (DateTime.now().hour - 12) * math.pi / 180;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double x = MediaQuery.of(context).size.width;
    final double y = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: Size(x, y),
          willChange: true,
          painter: DrawArc(
              ((x * .5 - x * .29) + (x * .5 - x * .332)) / 2,
              ((y / 3 - x * .332) + (y / 3 - x * .29)) / 2,
              ((x * .5 + x * .29) + (x * .5 + x * .332)) / 2,
              ((x * .332 + y / 3) + (x * .29 + y / 3)) / 2,
              Colors.teal[300].withOpacity(.8),
              hour),
        ),
        CustomPaint(
          size: Size(x, y),
          willChange: true,
          painter: DrawArc(
              ((x * .5 - x * .4) + (x * .5 - x * .34)) / 2,
              ((y / 3 - x * .34) + (y / 3 - x * .4)) / 2,
              ((x * .5 + x * .4) + (x * .5 + x * .34)) / 2,
              ((x * .34 + y / 3) + (x * .4 + y / 3)) / 2,
              Colors.blue[300].withOpacity(.9),
              minute),
        ),
        CustomPaint(
          size: Size(x, y),
          painter: DrawCircle(x * 0.29, PaintingStyle.fill),
        ),
        CustomPaint(
          size: Size(x, y),
          painter: DrawCircle(x * .34, PaintingStyle.stroke),
        ),
        CustomPaint(
          size: Size(x, y),
          painter: DrawCircle(x * .40, PaintingStyle.stroke),
        ),
      ],
    );
  }
}

//((size.width * .5 - size.width * .29) +
//(size.width * .5 - size.width * .332)) /
//2,
//((size.height / 3 - size.width * .332) +
//(size.height / 3 - size.width * .29)) /
//2,
//((size.width * .5 + size.width * .29) +
//(size.width * .5 + size.width * .332)) /
//2,
//((size.width * .332 + size.height / 3) +
//(size.width * .29 + size.height / 3)) /
//2,
//hour <= 12 ? 30 * hour : (hour - 12) * 30
