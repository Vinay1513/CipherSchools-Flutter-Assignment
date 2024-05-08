//import 'package:cipherschools_flutter_assignmnet/GetStartedScreen.dart';
//import 'package:cipherschools_flutter_assignmnet/Expenses.dart';
//import 'package:cipherschools_flutter_assignmnet/Income.dart';
import 'package:cipherschools_flutter_assignmnet/Home.dart';
//import 'package:cipherschools_flutter_assignmnet/Profile.dart';
//import 'package:cipherschools_flutter_assignmnet/Home.dart';
//import 'package:cipherschools_flutter_assignmnet/Signup.dart';
import 'package:flutter/material.dart';
//import 'package:cipherschools_flutter_assignmnet/Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
