import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/Model/firestore.dart';
import 'package:razza_app/View/Desgin/color.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DB db = DB();
  Style style = Style();
  var user = FirebaseAuth.instance.currentUser;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: Text(
          'History',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        backgroundColor: style.primaryColor,
      ),
      body: Container(
          width: double.infinity,
          child: db.showHistory(user!.uid)),
    );
  }
}
