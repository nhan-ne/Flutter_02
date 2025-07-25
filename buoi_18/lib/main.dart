import 'package:buoi_22/bai1/welcome.dart';
import 'package:buoi_22/bai2/welcome_Screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
        //bai1
        const WelcomeScreen(), 
        //bai2
        //const WelComeScreen2(), 
    );
  }
}