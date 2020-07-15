import 'package:flutter/material.dart';

class New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
//            !mounted;
              Navigator.pop(context, true);
            },
            child: Container(
              height: 50,
              width: 80,
              color: Colors.black,
            ),
          ),
        ),
        color: Colors.blue,
      ),
    );
  }
}
