import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class EachCateShimmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      body: Center(
        child: Shimmer(
          // This is the ONLY required parameter
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 300,
                height: 130,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 300,
                height: 130,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 300,
                height: 130,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 300,
                height: 130,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
          // This is the default value
          duration: Duration(seconds: 3),
          // This is NOT the default value. Default value: Duration(seconds: 0)
          interval: Duration(seconds: 5),
          // This is the default value
          color: Colors.white,
          // This is the default value
          colorOpacity: 0.3,
          // This is the default value
          enabled: true,
          // This is the default value
          direction: ShimmerDirection.fromLTRB(),
        ),
      ),
    );
  }
}
