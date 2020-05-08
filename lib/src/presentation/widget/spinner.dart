import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.lightBlue,
      child: Center(
        child: Loading(
          indicator: BallPulseIndicator(),
          size: 100.0,
          color: Colors.pink
        ),
      ),
    );
  }
}
