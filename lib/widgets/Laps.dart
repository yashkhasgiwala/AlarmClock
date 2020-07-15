import 'package:flutter/material.dart';
import 'package:alarmclock/constants.dart';

class Laps extends StatelessWidget {
  Laps(this.i, this.time);
  int i;
  String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Lap $i',
            style: kLapNo,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '$time',
            style: kLapTime,
          ),
        ],
      ),
    );
  }
}
