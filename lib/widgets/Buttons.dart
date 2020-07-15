import 'package:flutter/material.dart';
import 'package:alarmclock/constants.dart';

class ButtonUI extends StatelessWidget {
  Color color;
  String text;
  ButtonUI(this.text, this.color);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 55,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(27)),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: kButtonStyle,
          ),
        ),
      ),
    );
  }
}
