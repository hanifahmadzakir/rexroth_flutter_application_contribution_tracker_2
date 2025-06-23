import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
AnalogClock(
	decoration: BoxDecoration(
	    border: Border.all(width: 2.0, color: Colors.black),
	    color: Colors.transparent,
	    shape: BoxShape.circle),
      secondHandColor: Colors.blue,
	width: 150.0,
	isLive: true,
	hourHandColor: Colors.black,
	minuteHandColor: Colors.black,
	showSecondHand: true,
  digitalClockColor: Colors.blue,
	numberColor: Colors.black87,
	showNumbers: true,
	showAllNumbers: false,
	textScaleFactor: 1.4,
	showTicks: false,
	showDigitalClock: true,
	datetime: DateTime(2019, 1, 1, 9, 12, 15),
	)

  
	);
  }
}