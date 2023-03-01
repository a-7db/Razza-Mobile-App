import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:razza_app/Model/firestore.dart';
import 'package:razza_app/View/Desgin/adminPanel.dart';
import 'package:razza_app/View/Screens/Admin_Screens/Add_Product_Screen.dart';
import 'package:razza_app/View/Screens/Admin_Screens/manageProduct.dart';
import 'package:razza_app/View/Screens/User_Screens/Home.dart';
import 'package:razza_app/View/Screens/User_Screens/bottombar.dart';
import 'package:razza_app/View/Screens/signup-in/Email/signIn.dart';
import 'package:razza_app/View/Screens/signup-in/Phone/PhoneOTP.dart';

class Auth {
  DB db = DB();
  //***************************************************************** */

  //************ CREATE ACOUNT BY EMAIL & PASS ********************** */

  createAccountByEmail(emailAddress, password, userName, signUpScreen) async {
    try {
      print(emailAddress);
      print(password);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      var user = FirebaseAuth.instance.currentUser;
      db.addUsers(emailAddress, userName, user!.uid.toString());
      Navigator.pushReplacement(
          signUpScreen,
          MaterialPageRoute(
            builder: (signUpScreen) => BottomBarScreens(screen: 0),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        FancySnackbar.showSnackbar(
          signUpScreen,
          snackBarType: FancySnackBarType.error,
          title: "Password!",
          message: "The password provided is too weak.",
          duration: 5,
          // onCloseEvent: () {},
        );
      } else if (e.code == 'email-already-in-use') {
        FancySnackbar.showSnackbar(
          signUpScreen,
          snackBarType: FancySnackBarType.error,
          title: "Account is exixt!",
          message: "The account already exists for that email.",
          duration: 5,
          // onCloseEvent: () {},
        );
      }
    } catch (e) {
      print(e);
    }
  }

  //***************************************************************** */

  //************ CREATE ACOUNT BY EMAIL & PASS ********************** */

  //***************************************************************** */

  //************ SIGN IN BY EMAIL & PASS ********************** */

  sinInByEmail(emailAddress, password, loginScreen) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      var user = FirebaseAuth.instance.currentUser;

      db.isAdmin(user!.uid).then((value) {
        if (value == 'Admin') {
          Navigator.pushReplacement(loginScreen, MaterialPageRoute(
            builder: (context) {
              return AdminPanel(screen: 0);
            },
          ));
        } else {
          Navigator.pushReplacement(loginScreen, MaterialPageRoute(
            builder: (context) {
              return BottomBarScreens(screen: 0);
            },
          ));
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        FancySnackbar.showSnackbar(
          loginScreen,
          snackBarType: FancySnackBarType.error,
          title: "Create an account",
          message: "No user found for that email.",
          duration: 5,
          // onCloseEvent: () {},
        );
      } else if (e.code == 'wrong-password') {
        FancySnackbar.showSnackbar(
          loginScreen,
          snackBarType: FancySnackBarType.error,
          title: "Password!",
          message: "Wrong password provided for that user.",
          duration: 5,
          // onCloseEvent: () {},
        );
      }
    }
  }

  //***************************************************************** */

  //************ SIGN IN BY GOOGLE ********************** */

  signInByGoogle(loginScreen) {
    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      Navigator.pushReplacement(loginScreen, MaterialPageRoute(
        builder: (context) {
          return BottomBarScreens(screen: 1);
        },
      ));

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  //***************************************************************** */

  //************ SIGN IN BY FACEBOOK ********************** */

  signInByFaceBook(loginScreen) {
    Future<UserCredential> signInWithFacebook() async {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      Navigator.pushReplacement(loginScreen, MaterialPageRoute(
        builder: (context) {
          return BottomBarScreens(screen: 1);
        },
      ));

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
  }

  //***************************************************************** */

  //******************** SIGN IN BY PHONE NUMBER ********************** */
  final FirebaseAuth auth = FirebaseAuth.instance;
  var verID;

  sigInByPhoneNum(phoneNumber, phoneScreen) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+966' + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verID = verificationId;
        Navigator.pushReplacement(phoneScreen, MaterialPageRoute(
          builder: (phoneScreen) {
            return OTP_Screen(phoneNumber: phoneNumber);
          },
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  sentCode(smsCode, otpScreen) async {
    try {
      print(smsCode);
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verID, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      Navigator.pushReplacement(
          otpScreen,
          MaterialPageRoute(
            builder: (otpScreen) => BottomBarScreens(screen: 1),
          ));
    } catch (e) {
      print(e);
    }
  }

  logOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }
}
