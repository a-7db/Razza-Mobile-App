import 'package:animate_do/animate_do.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:razza_app/View/Screens/User_Screens/bottombar.dart';
import 'package:razza_app/View/Screens/signup-in/Email/signIn.dart';

import 'welcomPage.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 237, 237),
      body: AnimatedSplashScreen(
        duration: 5000,
        splash: Center(
          child: FadeIn(
            delay: Duration(milliseconds: 1500),
            duration: Duration(milliseconds: 3000),
            child: Container(
              width: 300,
              child: Image(image: AssetImage('images/logo.png'), fit: BoxFit.cover,),
            ),
          ),
        ), 
        nextScreen: LoginPage(),
      ),
    );
  }
}
