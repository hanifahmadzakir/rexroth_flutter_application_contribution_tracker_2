import 'package:flutter/material.dart';
import 'package:flutter_application_contribution_tracker_2/pages/home_page.dart';


void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home:HomePage(),
    );
  }
}