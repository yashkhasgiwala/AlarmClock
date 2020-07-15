import 'package:alarmclock/Screens/new.dart';
import 'package:flutter/material.dart';
import 'Screens/clockscreen.dart';
import 'Screens/stopwatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        children: <Widget>[
          ClockScreen(),
          stopwatch(),
//          New(),
        ],
      ),
    );
  }
}
