import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWaitting extends StatefulWidget {
  var nextScreen;
  LottieWaitting({super.key, required this.nextScreen});

  @override
  State<LottieWaitting> createState() => _LottieWaittingState();
}

class _LottieWaittingState extends State<LottieWaitting> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return widget.nextScreen;
              },
            )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Lottie.asset('assets/clothes-buying.json'),
        ),
      ),
    );
  }
}
