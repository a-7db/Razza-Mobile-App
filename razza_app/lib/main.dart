import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:razza_app/View/Desgin/adminPanel.dart';
import 'package:razza_app/View/Screens/Admin_Screens/Add_Product_Screen.dart';
import 'package:razza_app/View/Screens/Admin_Screens/manageProduct.dart';
import 'package:razza_app/View/Screens/User_Screens/Home.dart';
import 'package:razza_app/View/Screens/User_Screens/Product_Screen.dart';
import 'package:razza_app/View/Screens/User_Screens/bottombar.dart';
import 'package:razza_app/View/Screens/User_Screens/cart.dart';
import 'package:razza_app/View/Screens/signup-in/Email/signIn.dart';
import 'package:razza_app/View/Screens/signup-in/Email/signUp.dart';
import 'package:razza_app/View/Screens/signup-in/Phone/PhoneOTP.dart';
import 'package:razza_app/View/Screens/signup-in/Phone/signin_Phone.dart';
import 'package:razza_app/View/Screens/User_Screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomBarScreens(screen: 0,),
      debugShowCheckedModeBanner: false,
      
    );
  }
}