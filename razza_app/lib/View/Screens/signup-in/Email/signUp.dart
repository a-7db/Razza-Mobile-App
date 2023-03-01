import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/View/Screens/signup-in/Email/signIn.dart';
import '../../../Desgin/inputStyle.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  InputStyle inputStyle = InputStyle();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 43, 133),
      body: FadeInDown(
        child: SizedBox(
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              //bg design, we use 3 svg img
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

              //card and footer ui
              Positioned(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInDown(
                            delay: Duration(milliseconds: 500),
                            child: Container(
                              alignment: Alignment.center,
                              width: size.width * 0.9,
                              height: size.height * 0.83,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20),
                                  Container(
                                    height: 30,
                                    margin: EdgeInsets.only(left: 20, bottom: 20),
                                    child: Row(
                                      children: [
                                        FadeIn(
                                          delay: Duration(milliseconds: 800),
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage(),
                                                    ));
                                              },
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: Color.fromARGB(
                                                    255, 87, 43, 133),
                                              )),
                                        ),
                                        SizedBox(width: 6),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Back',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 87, 43, 133)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                  
                                  SizedBox(height: 10),
                  
                                  //logo & text
                                  FadeInLeft(
                                    delay: Duration(milliseconds: 900),
                                    child: Text(
                                      'SignUp',
                                      style: GoogleFonts.poppins(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 87, 43, 133)),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  FadeInLeft(
                                    delay: Duration(milliseconds: 1000),
                                    child: Text(
                                      'Sign up for more easy shopping',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        color: Color.fromARGB(255, 87, 43, 133),
                                      ),
                                    ),
                                  ),
                                  // logo(size.height / 8, size.height / 8),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                  
                                  //email & password textField
                                  FadeInDown(
                                      child: inputStyle.useranem_textField(size),
                                      delay: Duration(milliseconds: 1200)),
                  
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  FadeInDown(
                                      child: inputStyle.email_SUP_TextField(size),
                                      delay: Duration(milliseconds: 1200)),
                  
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  FadeInDown(
                                      child: inputStyle
                                          .passwordTextFieldSignUP(size),
                                      delay: Duration(milliseconds: 1600)),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  FadeInDown(
                                      child: inputStyle
                                          .confermpasswordTextField(size),
                                      delay: Duration(milliseconds: 1800)),
                  
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                  
                                  //sign in button
                                  FadeInDown(
                                      child: inputStyle.signUpButton(size, this.context),
                                      delay: Duration(milliseconds: 2000)),
                  
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                  
                                  
                                ],
                              ),
                            ),
                          ),
                        ],
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
