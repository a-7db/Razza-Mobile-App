import 'package:flutter/material.dart';
import 'package:razza_app/Screens/signup-in/Email/signIn.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(248, 248, 248, 248),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              child: FadeInDown(
                child: Image(
                  image: AssetImage('images/set of man clothing2.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomLeft,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FadeInLeft(
                        delay: Duration(milliseconds: 500),
                        child: Text("Enjoy Your Online Shopping.",
                            style: GoogleFonts.signika(
                              height: 1.2,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 80, 59, 164),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FadeInLeft(
                        delay: Duration(milliseconds: 1000),
                        child: Text(
                          "Browse through all categories and shop for the best Saudi Clothing for your new look",
                          style: GoogleFonts.signika(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeInLeft(
                    delay: Duration(milliseconds: 1500),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 70,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ));
                        },
                        child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 87, 43, 133),
                                    Color.fromARGB(255, 80, 59, 164)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: 70,
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.90,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.signika(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )),
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(248, 248, 248, 248)),
                      ),
                    ),
                  ),
                  Container(height: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
