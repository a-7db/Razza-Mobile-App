import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/View/Screens/signup-in/Email/signIn.dart';
import '../../../Desgin/inputStyle.dart';

class SginInPHONE extends StatefulWidget {
  const SginInPHONE({super.key});

  @override
  State<SginInPHONE> createState() => _SginInPHONEState();
}

class _SginInPHONEState extends State<SginInPHONE> {
  var inputStyle = InputStyle();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 43, 133),
      body: FadeInDown(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              //left shape
              Positioned(
                left: -34,
                top: 181.0,
                child: SvgPicture.string(
                  // Group 3178
                  '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 99.0,
                  height: 99.0,
                ),
              ),

              //right shape
              Positioned(
                right: -52,
                top: 45.0,
                child: SvgPicture.string(
                  // Group 3177
                  '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 139.0,
                  height: 139.0,
                ),
              ),

              Positioned(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.06),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage(),
                                              ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 10),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white70,
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.arrow_back,
                                              color: Color.fromARGB(
                                                  255, 87, 43, 133)),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text(
                                          'Back',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              color: Colors.white70),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Column(
                                    children: [
                                      FadeInLeft(
                                        delay: Duration(milliseconds: 500),
                                        child: Text(
                                          'SignIn',
                                          style: GoogleFonts.poppins(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      FadeInLeft(
                                        delay: Duration(milliseconds: 700),
                                        child: Text(
                                          'With Phone',
                                          style: GoogleFonts.poppins(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            

                            
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  FadeInLeft(
                                    delay: Duration(milliseconds: 800),
                                    child: Text(
                                      'Create an account or signin With phone number',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  FadeInLeft(
                                    child:
                                        inputStyle.phoneTextField_signin(size),
                                    delay: Duration(milliseconds: 1200),
                                  ),
                                  
                                ],
                              ),
                            ),

                            //sign in button & continue with text here
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  FadeInLeft(
                                    child: inputStyle.signInButtonByPhone(size, this.context),
                                    delay: Duration(milliseconds: 2200),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  
                                ],
                              ),
                            ),

                            
                          ],
                        ),
                      ),
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
