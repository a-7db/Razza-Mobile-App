// ignore_for_file: unnecessary_null_comparison

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/View/Desgin/cards.dart';
import 'package:razza_app/View/Screens/User_Screens/bottombar.dart';

import '../../../Model/firestore.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cards myCard = Cards();
  DB db = DB();

  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');
  var user = FirebaseAuth.instance.currentUser;

  double total = 0;
  double tax = 0;
  double wholeTotal = 0;

  void totalOperation() {
    double total2 = 0;
    FirebaseFirestore.instance
        .collection('cart')
        .where('UID', isEqualTo: user!.uid)
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                total2 = total2 + element['price'];
                total = total2;
                tax = total * 0.15;
                wholeTotal = total + tax;
              });
            }));
  }

  int itemCount = 0;
  void getCount() {
    int count = 0;
    setState(() {
      cartCollection.where('UID', isEqualTo: user!.uid).get().then((value) {
        count = value.docs.length;
        itemCount = count;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // db.getprices(user!.uid);
    totalOperation();
    getCount();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: [
              SizedBox(height: 15),
              FadeInDown(
                child: Text(
                  'Shopping Cart',
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Color.fromARGB(255, 87, 43, 133),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 30),
              Container(height: 440, child: db.showCart(user!.uid)),
            ],
          ),
        ),
        Positioned(
          child: FadeInUp(
            delay: Duration(milliseconds: 300),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, -5.0),
                      blurRadius: 20,
                      spreadRadius: -20,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInLeft(
                          delay: Duration(milliseconds: 600),
                          child: Text(
                            'Total ($itemCount Items)',
                            style: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 17),
                          ),
                        ),
                        FadeInRight(
                          delay: Duration(milliseconds: 600),
                          child: Text(
                            'SR $total',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Color.fromARGB(255, 77, 35, 121),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInLeft(
                          delay: Duration(milliseconds: 800),
                          child: Text(
                            'TAX %',
                            style: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 17),
                          ),
                        ),
                        FadeInRight(
                          delay: Duration(milliseconds: 800),
                          child: Text(
                            'SR $tax',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      db.addToHistory(
                          user!.uid, wholeTotal, total, tax, itemCount);
                      
                      db.loading(BottomBarScreens(screen: 1), context);
                    },
                    child: FadeInUp(
                      delay: Duration(milliseconds: 1100),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 12),
                          child: Center(
                            child: Text(
                              'Checkout  |  SR $wholeTotal',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 77, 35, 121),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
