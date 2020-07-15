import 'package:flutter/material.dart';
import 'package:alarmclock/widgets/clockui.dart';
import 'package:alarmclock/constants.dart';
import 'dart:async';
import 'package:alarmclock/widgets/PageTitle.dart';

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  String hour = DateTime.now().hour == 12
          ? '12'
          : TimeOfDay.now().hourOfPeriod.toString(),
      minute = DateTime.now().minute <= 9
          ? '0' + DateTime.now().minute.toString()
          : DateTime.now().minute.toString();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
    super.initState();
  }

  void getTime() {
    if (mounted) {
      setState(() {
        hour = DateTime.now().hour == 12
            ? '12'
            : TimeOfDay.now().hourOfPeriod.toString();
        minute = DateTime.now().minute <= 9
            ? '0' + DateTime.now().minute.toString()
            : DateTime.now().minute.toString();
      });
    }
  }

  int day = DateTime.now().day,
      month = DateTime.now().month,
      year = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    final double y = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Clock(),
          Padding(
            padding: EdgeInsets.only(bottom: y / 3.4),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("$hour:$minute", style: kTime),
                  Text(DateTime.now().hour < 12 ? 'AM' : 'PM', style: kPeriod)
                ],
              ),
            ),
          ),
          PageTitle('Clock'),
//          Padding(
//            padding: EdgeInsets.only(top: y / 1.7),
//            child: Text(
//              '$day-$month-$year',
//              style: TextStyle(
//                fontSize: 20,
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}
