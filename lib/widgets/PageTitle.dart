import 'package:flutter/material.dart';
import 'package:alarmclock/constants.dart';

class PageTitle extends StatelessWidget {
  final String name;
  PageTitle(this.name);
  @override
  Widget build(BuildContext context) {
    final double x = MediaQuery.of(context).size.width;
    final double y = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: y / 17, left: x / 12),
      child: Text(
        name,
        style: kPageTitle,
      ),
    );
  }
}
