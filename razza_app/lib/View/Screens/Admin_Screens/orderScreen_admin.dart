import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/Model/firestore.dart';

class Admin_order_Screen extends StatefulWidget {
  const Admin_order_Screen({super.key});

  @override
  State<Admin_order_Screen> createState() => _Admin_order_ScreenState();
}

class _Admin_order_ScreenState extends State<Admin_order_Screen> {
  DB db = DB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Last Orders', style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 87, 43, 133),
                  fontSize: 20
                ),),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: db.getOrdersToAdmin(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
