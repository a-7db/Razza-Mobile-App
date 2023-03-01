import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Model/firestore.dart';
import '../../Desgin/color.dart';

class LastOrders extends StatefulWidget {
  var date;
  var role;
  LastOrders({super.key, required this.date, required this.role});

  @override
  State<LastOrders> createState() => _LastOrdersState();
}

class _LastOrdersState extends State<LastOrders> {
  DB db = DB();
  Style style = Style();
  var user = FirebaseAuth.instance.currentUser;

  var dt, orderNO, total, wholeTotal, tax, email, UID;
  showOrderDetails() {
    widget.role == 2
        ? FirebaseFirestore.instance
            .collection('orders')
            .where('UID', isEqualTo: user!.uid)
            .where('DT', isEqualTo: widget.date)
            .get()
            .then((value) => value.docs.forEach((element) {
                  setState(() {
                    setState(() {
                      dt = db.formattedDate(element['DT']);
                      orderNO = element['orderNO'];
                      total = element['total'];
                      wholeTotal = element['wholeTotal'];
                      tax = element['tax'];
                      email = element['email'];
                      UID = element['UID'];
                    });
                  });
                }))
        : FirebaseFirestore.instance
            .collection('orders')
            .where('DT', isEqualTo: widget.date)
            .get()
            .then((value) => value.docs.forEach((element) {
                  setState(() {
                    setState(() {
                      dt = db.formattedDate(element['DT']);
                      orderNO = element['orderNO'];
                      total = element['total'];
                      wholeTotal = element['wholeTotal'];
                      tax = element['tax'];
                      email = element['email'];
                      UID = element['UID'];
                    });
                  });
                }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showOrderDetails();
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              child: FadeInLeft(
                  child: Text(
                      widget.role == 2 ? 'Your order items' : 'Order Items',
                      style: GoogleFonts.poppins(fontSize: 18))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
                width: double.infinity,
                height: 130,
                child: db.showOrders(user!.uid, widget.date)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: FadeIn(
                delay: Duration(milliseconds: 500),
                child: Text('Details of items',
                    style: GoogleFonts.poppins(fontSize: 18)),
              ),
            ),
          ),
          Center(
            child: FadeInUp(
              delay: Duration(milliseconds: 700),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [style.kshadow]),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeInLeft(
                            delay: Duration(milliseconds: 900),
                            child: Text('Order NO',
                                style: GoogleFonts.poppins(fontSize: 15)),
                          ),
                          orderNO != null
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 900),
                                  child: Text('$orderNO',
                                      style: GoogleFonts.poppins(fontSize: 15)),
                                )
                              : Text(
                                  "Example@email.com",
                                  style: GoogleFonts.flowCircular(
                                      color: Colors.grey[200]),
                                ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(child: Divider(thickness: 1.2), width: 300),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeInLeft(
                            delay: Duration(milliseconds: 1100),
                            child: Text('Order Date',
                                style: GoogleFonts.poppins(fontSize: 15)),
                          ),
                          dt != null
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 1100),
                                  child: Text('$dt',
                                      style: GoogleFonts.poppins(fontSize: 15)))
                              : Text(
                                  "22-22-2222",
                                  style: GoogleFonts.flowCircular(
                                      color: Colors.grey[200]),
                                ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(child: Divider(thickness: 1.2), width: 300),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeInLeft(
                            delay: Duration(milliseconds: 1300),
                            child: Text('Subtotal',
                                style: GoogleFonts.poppins(fontSize: 15)),
                          ),
                          total != null
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 1300),
                                  child: Text('$total',
                                      style: GoogleFonts.poppins(fontSize: 15)))
                              : Text(
                                  "300.0",
                                  style: GoogleFonts.flowCircular(
                                      color: Colors.grey[200]),
                                ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(child: Divider(thickness: 1.2), width: 300),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeInLeft(
                              delay: Duration(milliseconds: 1600),
                              child: Text('Tax',
                                  style: GoogleFonts.poppins(fontSize: 15))),
                          tax != null
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 1600),
                                  child: Text('$tax',
                                      style: GoogleFonts.poppins(fontSize: 15)))
                              : Text(
                                  "45.0",
                                  style: GoogleFonts.flowCircular(
                                      color: Colors.grey[200]),
                                ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(child: Divider(thickness: 1.2), width: 300),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FadeInLeft(
                              delay: Duration(milliseconds: 1800),
                              child: Text('Total',
                                  style: GoogleFonts.poppins(fontSize: 15))),
                          wholeTotal != null
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 1800),
                                  child: Text('$wholeTotal',
                                      style: GoogleFonts.poppins(fontSize: 15)),
                                )
                              : Text(
                                  "1154.0",
                                  style: GoogleFonts.flowCircular(
                                      color: Colors.grey[200]),
                                ),
                        ],
                      ),
                      widget.role == 1
                          ? Column(
                              children: [
                                SizedBox(height: 10),
                                Container(
                                    child: Divider(thickness: 1.2), width: 300),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FadeInLeft(
                                        delay: Duration(milliseconds: 1800),
                                        child: Text('Customer Email',
                                            style: GoogleFonts.poppins(
                                                fontSize: 15))),
                                    wholeTotal != null
                                        ? FadeInRight(
                                            delay: Duration(milliseconds: 1800),
                                            child: Text('$email',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15)),
                                          )
                                        : Text(
                                            "1154.0",
                                            style: GoogleFonts.flowCircular(
                                                color: Colors.grey[200]),
                                          ),
                                  ],
                                ),
                                
                              ],
                            )
                          : Container(),
                      widget.role == 1
                          ? SizedBox(height: 10)
                          : SizedBox(height: 50),
                      Center(
                        child: FadeInUp(
                          delay: Duration(milliseconds: 1900),
                          child: Container(
                            child: Image(image: AssetImage('images/logo.png')),
                            width: 200,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
