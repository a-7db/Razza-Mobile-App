import 'package:flutter/material.dart';
import 'package:razza_app/Screens/signup-in/Email/signUp.dart';
import 'package:razza_app/Screens/splash.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp_Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}