// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/Model/firestore.dart';
import 'package:appbar_animated/appbar_animated.dart';
import 'package:razza_app/View/Desgin/color.dart';
import 'package:razza_app/View/Desgin/effects.dart';

class Product_Screen extends StatefulWidget {
  String productID, title, cate, image, color, desc;
  var elementID;
  int price;

  Product_Screen({
    super.key,
    required this.elementID,
    required this.productID,
    required this.image,
    required this.title,
    required this.cate,
    required this.price,
    required this.color,
    required this.desc,
  });

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
  DB db = DB();
  Effects effects = Effects();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar:
            const ColorBuilder(Colors.transparent, Colors.blue),
        textColorAppBar: const ColorBuilder(Colors.white),
        appBarBuilder: _appBar,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 60,
                  left: 30,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 25,
                            spreadRadius: 2)
                      ]),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.60,
                ),
                height: 480,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: details(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding details(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            width: 70,
            height: 6,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50)),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeInLeft(
                delay: Duration(milliseconds: 500),
                child: Container(
                  width: 250,
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              FadeInRight(
                delay: Duration(milliseconds: 500),
                child: Container(
                  child: Text(
                    'SAR  ' + widget.price.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          FadeInLeft(
            delay: Duration(milliseconds: 1000),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.cate,
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Color.fromARGB(255, 80, 59, 164)),
              ),
            ),
          ),
          SizedBox(height: 10),
          FadeInLeft(
            delay: Duration(milliseconds: 1000),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.desc,
                style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20),
          FadeInLeft(
            delay: Duration(milliseconds: 1500),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Color',
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Color.fromARGB(255, 80, 59, 164)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              FadeIn(
                  delay: Duration(milliseconds: 1600),
                  child: color(Colors.black, true)),
              SizedBox(width: 10),
              FadeIn(
                  delay: Duration(milliseconds: 1700),
                  child: color(Colors.purple[200], false)),
              SizedBox(width: 10),
              FadeIn(
                  delay: Duration(milliseconds: 1800),
                  child: color(Colors.orange[200], false)),
              SizedBox(width: 10),
              FadeIn(
                  delay: Duration(milliseconds: 1900),
                  child: color(Colors.grey[400], false)),
              SizedBox(width: 10),
              FadeIn(
                  delay: Duration(milliseconds: 2000),
                  child: color(Colors.pink[100], false)),
              SizedBox(width: 10)
            ],
          ),
          SizedBox(height: 20),
          FadeInLeft(
            delay: Duration(milliseconds: 2000),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Size',
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Color.fromARGB(255, 80, 59, 164)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              FadeIn(
                  delay: Duration(milliseconds: 2000),
                  child: productSizes('S', false)),
              SizedBox(width: 10),
              FadeIn(
                  delay: Duration(milliseconds: 2200),
                  child: productSizes('M', true)),
              SizedBox(width: 10),
              FadeIn(
                  delay: Duration(milliseconds: 2400),
                  child: productSizes('L', false)),
              SizedBox(width: 10),
              FadeIn(
                  delay: Duration(milliseconds: 2600),
                  child: productSizes('XL', false)),
            ],
          ),
          SizedBox(height: 30),
          effects.loadingButton(() {
            db.addToCart(widget.productID, widget.image, widget.title,
                widget.cate, widget.price, 1);
            effects.showAchievementView(context, 'Did you like it?', widget.title + ' is added in your cart', 1, Icons.favorite);
          }, context)
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return Container();
  }

  Stack adv(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 60,
              left: 20,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1), blurRadius: 25, spreadRadius: 2)
                  ]),
                ),
              )),
          Positioned(
            bottom: 500 - MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: FadeInUp(
              delay: Duration(milliseconds: 200),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Container()),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 2.4,
              left: MediaQuery.of(context).size.width / 1.25,
              child: InkWell(
                onTap: () {
                  db.addToCart(widget.productID, widget.image, widget.title,
                      widget.cate, widget.price, 1);
                },
                child: ZoomIn(
                  delay: Duration(milliseconds: 400),
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Color.fromARGB(255, 110, 56, 167),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 5),
                              blurRadius: 15,
                              spreadRadius: -5)
                        ]),
                  ),
                ),
              ))
        ]);
  }
}

color(color, selected) {
  return Container(
    child: selected == true && color == Colors.black
        ? Icon(
            Icons.done,
            color: Colors.white,
          )
        : selected == true && color != Colors.black
            ? Icon(Icons.done)
            : Container(),
    width: 30,
    height: 30,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

productSizes(size, selected) {
  return Container(
    child: Center(
        child: Text(
      size,
      style: TextStyle(color: selected == false ? Colors.black : Colors.white),
    )),
    width: 30,
    height: 30,
    decoration: BoxDecoration(
        color: selected == false
            ? Colors.grey[200]
            : Color.fromARGB(255, 80, 59, 164),
        shape: BoxShape.circle),
  );
}
