import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Desgin/cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Cards CardofItems = Cards();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 43, 133),
      body: FadeInDown(
        child: SizedBox(
          height: size.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              
              Positioned(
                left: -26,
                top: 51.0,
                child: SvgPicture.string(
                  '<svg viewBox="-26.0 51.0 91.92 91.92" ><path transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, -26.0, 96.96)" d="M 48.75 0 L 65 32.5 L 48.75 65 L 16.24999809265137 65 L 0 32.5 L 16.25000381469727 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, -10.83, 105.24)" d="M 0 0 L 27.625 11.05000019073486 L 55.25 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, 16.51, 93.51)" d="M 0 37.04999923706055 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 91.92,
                  height: 91.92,
                ),
              ),
              Positioned(
                right: 43.0,
                top: -103,
                child: SvgPicture.string(
                  '<svg viewBox="63.0 -103.0 268.27 268.27" ><path transform="matrix(0.5, -0.866025, 0.866025, 0.5, 63.0, 67.08)" d="M 147.2896423339844 0 L 196.3861999511719 98.19309997558594 L 147.2896423339844 196.3861999511719 L 49.09654235839844 196.3861999511719 L 0 98.19309234619141 L 49.09656143188477 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.5, -0.866025, 0.866025, 0.5, 113.73, 79.36)" d="M 0 0 L 83.46413421630859 33.38565444946289 L 166.9282684326172 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.5, -0.866025, 0.866025, 0.5, 184.38, 23.77)" d="M 0 111.9401321411133 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 268.27,
                  height: 268.27,
                ),
              ),
              Positioned(
                right: -19,
                top: 31.0,
                child: SvgPicture.string(
                  '<svg viewBox="329.0 31.0 65.0 65.0" ><path transform="translate(329.0, 31.0)" d="M 48.75 0 L 65 32.5 L 48.75 65 L 16.24999809265137 65 L 0 32.5 L 16.25000381469727 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(333.88, 47.58)" d="M 0 0 L 27.625 11.05000019073486 L 55.25 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(361.5, 58.63)" d="M 0 37.04999923706055 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 65.0,
                  height: 65.0,
                ),
              ),
              Positioned(
                top: 90,
                child: Container(
                  width: 300,
                  child: Text('We only offer the most valuable to the Razza men', style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25
                  ),),
                ),
              ),

              
              Positioned(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInUp(
                          delay: Duration(milliseconds: 500),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: size.width,
                                  height: size.height * 0.45,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 246, 246, 246),
                                  ),),

                                  Positioned(
                                    child: Container(
                                      height: size.height / 1.8,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.85,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    // gridDelegate:
                                    //     SliverGridDelegateWithFixedCrossAxisCount(
                                    //         crossAxisCount: 2),
                                    children: [
                                      CardofItems.homePageCards('Red Shmaq','red-shamq.jpg', this.context),
                                      CardofItems.homePageCards('White Shmaq', 'white-shamq.png', this.context),
                                      CardofItems.homePageCards('Watch', 'watch.png', this.context),
                                      CardofItems.homePageCards('Shoes', 'shoes.jpg', this.context),
                                      CardofItems.homePageCards('Glsses', 'glasses.png', this.context),
                                      CardofItems.homePageCards('Kabck', 'kaback.png', this.context),
                                      CardofItems.homePageCards('Mesbah', 'Mesbah.jpg', this.context),
                                      CardofItems.homePageCards('Perfume', 'perfume.png', this.context),
                                      CardofItems.homePageCards('Package', 'package.png', this.context),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//                                   width: 120,
//                                   height: 200,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Container(
//                                         child: Image(
//                                             image: AssetImage(
//                                                 'images/red-shamq.jpg')),
//                                         width: 120,
//                                       ),
//                                       Text('Red Shapq')
//                                     ],
//                                   ),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(15),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             offset: Offset(0, 5),
//                                             blurRadius: 20,
//                                             spreadRadius: -20)
//                                       ]),
//                                 ),
//                               ),
