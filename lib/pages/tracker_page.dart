import 'package:flutter/material.dart';
import 'package:flutter_application_contribution_tracker_2/utils/checkout_button.dart';
import 'package:flutter_application_contribution_tracker_2/utils/clock_card.dart';
import 'package:flutter_application_contribution_tracker_2/utils/checkin_button.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(152, 193, 217, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClockCard(),
            SizedBox(height: 30,),
            CheckinButton(),
            SizedBox(height: 10,),
            CheckoutButton(),
          ],
        ),
      ),
    );
  }
}