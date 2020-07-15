import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alarmclock/widgets/PageTitle.dart';
import 'package:alarmclock/widgets/Neu.dart';
import 'package:alarmclock/widgets/shapes.dart';
import 'package:alarmclock/widgets/Buttons.dart';
import 'package:alarmclock/constants.dart';
import 'dart:core';
import 'dart:async';
import 'package:alarmclock/widgets/Laps.dart';

Stopwatch s = Stopwatch();

class stopwatch extends StatefulWidget {
  @override
  _stopwatchState createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  int hour = 0, min = 0, sec = 0, milli = 0;
  var laps = [];
  bool start = true, stop = false, lap = false, resume = false, reset = false;
  final dur = const Duration(milliseconds: 1);
  void starttimer() {
    Timer(dur, run);
  }

  void run() {
    if (s.isRunning) {
      starttimer();
    }
    setState(() {
      milli = (s.elapsed.inMilliseconds) % 100;
      sec = (s.elapsed.inSeconds) % 60;
      min = (s.elapsed.inMinutes) % 60;
      hour = s.elapsed.inHours;
    });
  }

  void Start() {
    setState(() {
      start = false;
      stop = true;
      lap = true;
    });
    s.start();
    starttimer();
  }

  void Lap() {
    setState(() {
      laps.add('$hour:$min:$sec:$milli');
    });
  }

  void Stop() {
    setState(() {
      resume = true;
      reset = true;
      stop = false;
      lap = false;
    });
    s.stop();
  }

  void Resume() {
    setState(() {
      resume = false;
      reset = false;
      stop = true;
      lap = true;
    });
    s.start();
    starttimer();
  }

  void Reset() {
    s.reset();
    setState(() {
      resume = false;
      reset = false;
      start = true;
      hour = 0;
      min = 0;
      sec = 0;
      milli = 0;
      laps.length = 0;
      laps = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final double y = MediaQuery.of(context).size.height;
    final double x = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(x, y),
            foregroundPainter: DrawLine1(),
            child: Padding(
              padding: EdgeInsets.only(bottom: y / 3),
              child: Neumorphic(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: y / 3),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    '$hour:$min:$sec',
                    style: khms,
                  ),
                  Text(
                    '$milli',
                    style: kmilli,
                  ),
                ],
              ),
            ),
          ),
          PageTitle('Stopwatch'),
          Padding(
            padding: EdgeInsets.only(top: y / 1.8, right: 10, left: 10),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 3),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Visibility(
                      visible: start,
                      child: GestureDetector(
                        onTap: () {
                          Start();
                        },
                        child: ButtonUI('START', Colors.green),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Visibility(
                          visible: stop,
                          child: GestureDetector(
                            onTap: () {
                              Stop();
                            },
                            child: ButtonUI('STOP', Colors.red),
                          ),
                        ),
                        Visibility(
                          visible: lap,
                          child: GestureDetector(
                            onTap: () {
                              Lap();
                            },
                            child: ButtonUI('LAP', Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Visibility(
                          visible: resume,
                          child: GestureDetector(
                            onTap: () {
                              Resume();
                            },
                            child: ButtonUI('RESUME', Colors.green),
                          ),
                        ),
                        Visibility(
                          visible: reset,
                          child: GestureDetector(
                            onTap: () {
                              Reset();
                            },
                            child: ButtonUI('RESET', Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: y / 1.55),
            child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return Laps(Index + 1, laps[Index]);
                }),
          ),
        ],
      ),
    );
  }
}
//laps.length, laps[laps.length]
