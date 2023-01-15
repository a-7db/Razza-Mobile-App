import 'package:flutter/material.dart';
import 'package:razza_app/login_register/loginPage.dart';

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

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
              child: Image(
                image: NetworkImage(
                    'https://cdn.salla.sa/KDQqa/73jnsJyJnwMDeV34mNVZ9mbVkbmgmCb0KKi9IKls.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topRight,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enjoy Your Online Shopping.",
                  style: TextStyle(
                      height: 1.2,
                      fontFamily: 'cairo',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: '#2b5785'.toColor()),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enjoy Your Online Shopping.Enjoy Your Online Shopping.Enjoy Your Online Shopping.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
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
                            Color(0xff2b5785),
                            Color.fromARGB(255, 59, 110, 164)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 70,
                        maxWidth: MediaQuery.of(context).size.width * 0.90,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(248, 248, 248, 248)),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
