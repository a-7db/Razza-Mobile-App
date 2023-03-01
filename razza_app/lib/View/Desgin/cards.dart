import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/Model/firestore.dart';
import 'package:razza_app/View/Desgin/color.dart';
import 'package:razza_app/View/Desgin/effects.dart';
import 'package:razza_app/View/Screens/Admin_Screens/editScreen.dart';
import 'package:razza_app/View/Screens/User_Screens/Product_Screen.dart';
import 'package:razza_app/View/Screens/User_Screens/cart.dart';
import 'package:razza_app/View/Screens/User_Screens/categories.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../Screens/User_Screens/orders.dart';

DB db = DB();
Effects effects = Effects();

class Cards {
  // cards(image, title, price, cate, context) {
  //   return InkWell(
  //     onTap: () {
  //       // Navigator.push(context, MaterialPageRoute(
  //       //   builder: (context) {
  //       //     return Product_Screen(
  //       //         image: image, title: title, cate: cate, price: price, color: co,);
  //       //   },
  //       // ));
  //     },
  //     child: Container(
  //       margin: EdgeInsets.only(right: 15),
  //       height: 200,
  //       width: 200,
  //       decoration: BoxDecoration(
  //           color: Colors.white, borderRadius: BorderRadius.circular(15)),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 190,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: Image(
  //                   image: AssetImage('images/' + image),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             //  TEXT
  //             Container(
  //               width: 180,
  //               height: 98,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         title,
  //                         style: GoogleFonts.ribeye(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black),
  //                       ),
  //                       SizedBox(height: 5),
  //                       Text(
  //                         cate,
  //                         style: GoogleFonts.poppins(
  //                             color: Colors.grey, fontWeight: FontWeight.w500),
  //                       ),
  //                     ],
  //                   ),
  //                   Container(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       crossAxisAlignment: CrossAxisAlignment.end,
  //                       children: [
  //                         Text(
  //                           'SAR ' + price.toString(),
  //                           style: GoogleFonts.poppins(
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.black),
  //                         ),
  //                         Container(
  //                           decoration: BoxDecoration(
  //                               shape: BoxShape.circle,
  //                               color: Color.fromARGB(255, 87, 43, 133)),
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(5.0),
  //                             child: Icon(
  //                               Icons.add_rounded,
  //                               color: Colors.white,
  //                               size: 25,
  //                             ),
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  EachCategory(image, title, price, cate) {
    return FadeInRight(
      delay: Duration(milliseconds: 200),
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        width: 300,
        height: 130,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 110,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // TEXT
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      cate,
                      style: GoogleFonts.poppins(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  width: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SAR ' + price.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  homePageCards(cate, image, home) {
    return InkWell(
      onTap: () {
        Navigator.push(home, MaterialPageRoute(
          builder: (context) {
            return Category(cate: cate);
          },
        ));
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image(image: AssetImage('images/' + image)),
              width: 120,
            ),
            Text(
              cate,
              style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 53, 24, 85),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: Color.fromARGB(255, 183, 183, 183))
            ]),
      ),
    );
  }

  catePage(cateScreen, elementID, productID, image, title, price, cate, color,
      desc) {
    return InkWell(
      onTap: () {
        Navigator.push(cateScreen, MaterialPageRoute(
          builder: (context) {
            return Product_Screen(
                elementID: elementID,
                productID: productID,
                image: image,
                title: title,
                cate: cate,
                price: price,
                color: color,
                desc: desc);
          },
        ));
      },
      child: Container(
        width: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Hero(
                        tag: image,
                        child: Image(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      )),
                  width: double.infinity,
                  height: 120,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 150,
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 53, 24, 85),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cate,
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 87, 43, 133),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'SR ' + price.toString(),
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 87, 43, 133),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      db.addToCart(productID, image, title, cate, price, 1);
                      effects.showAchievementView(
                          cateScreen,
                          'Did you like it?',
                          title + ' is added in your cart',
                          2,
                          Icons.favorite_rounded);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 87, 43, 133),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: Color.fromARGB(255, 183, 183, 183))
            ]),
      ),
    );
  }

  showManagement(
      ctx, elementID, itemID, name, image, price, cate, desc, color) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Column(
        children: [
          Slidable(
            // Specify a key if the Slidable is dismissible.
            // key: const ValueKey(0),

            // The start action pane is the one at the left or the top side.
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (ctx) {
                    db.deleteProduct(elementID);
                    effects.showAchievementView(
                        ctx,
                        'Deleting',
                        '$name is deleted successfully',
                        1,
                        Icons.delete_outline_rounded);
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (ctx) {
                    Navigator.push(
                        ctx,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(
                              elementID: elementID,
                              id: itemID,
                              name: name,
                              image: image,
                              cate: cate,
                              color: color,
                              price: price,
                              desc: desc),
                        ));
                  },
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(224, 224, 224, 1))),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                  title: Text(name),
                  subtitle: Text(cate),
                  leading: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      )),
                  trailing: Text('SR ' + price.toString()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  historyCard(ctx, orderNo, dt, total, itemCount, dateTime) {
    return FadeInDown(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Container(
          // width: MediaQuery.of(ctx).size.width / 1.5,
          height: 160,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color.fromARGB(255, 213, 213, 213)),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              SizedBox(height: 5),
              Container(
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20),
                    Container(
                      width: 70,
                      height: 70,
                      child: Image(
                        image: AssetImage('images/logo.png'),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 213, 213, 213)),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$orderNo',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                          Text('SR $total',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500)),
                          Text('$dt',
                              style: GoogleFonts.poppins(color: Colors.grey))
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 50,
                      child: Text(
                        '+$itemCount',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 87, 43, 133),
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
              Container(child: Divider(thickness: 1.2), width: 300),
              InkWell(
                onTap: () {
                  Navigator.push(ctx, MaterialPageRoute(
                    builder: (context) {
                      return LastOrders(
                        date: dateTime,
                        role: 2,
                      );
                    },
                  ));
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('See Details',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 87, 43, 133),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showOrdersToAdmin(ctx, orderNo, dt, total, itemCount, dateTime, UID) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(ctx).size.width / 1.5,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 243, 243, 243),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: Color.fromARGB(255, 183, 183, 183))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.numbers,
                            color: Color.fromARGB(255, 87, 43, 133)),
                        SizedBox(width: 10),
                        Text(
                          '$orderNo',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 87, 43, 133)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.today,
                            color: Color.fromARGB(255, 87, 43, 133)),
                        SizedBox(width: 10),
                        Text(
                          '$dt',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 87, 43, 133)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money,
                            color: Color.fromARGB(255, 87, 43, 133)),
                        SizedBox(width: 10),
                        Text(
                          'SR $total',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 87, 43, 133)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 40),
              Container(
                width: 1,
                height: 120,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 87, 43, 133),
                    borderRadius: BorderRadius.circular(20)),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(ctx, MaterialPageRoute(
                    builder: (context) {
                      return LastOrders(date: dateTime, role: 1);
                    },
                  ));
                },
                child: Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '+$itemCount',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 87, 43, 133),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'See Details',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 87, 43, 133)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // End
}

class CartDesign extends StatefulWidget {
  String prodID, image, title, cate, price, quantity;
  var elementID;
  // final Function checkValue;
  CartDesign({
    super.key,
    required this.elementID,
    required this.prodID,
    required this.image,
    required this.title,
    required this.cate,
    required this.price,
    required this.quantity,
  });

  @override
  State<CartDesign> createState() => _CartDesignState();
}

class _CartDesignState extends State<CartDesign> {
  DB db = DB();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: 1100),
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 110,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: Color.fromARGB(255, 183, 183, 183))
            ]),
        child: Row(children: [
          Container(
            width: 100,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          // TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 210,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 170,
                          child: Text(
                            widget.title,
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            db.deleteFromCart(widget.elementID);
                          },
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: Color.fromARGB(255, 87, 43, 133),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.cate,
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                width: 210,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SAR ' + widget.price.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffbf3f3f3)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                  child: Icon(
                                    Icons.add,
                                    size: 19,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                widget.quantity.toString(),
                                style: GoogleFonts.poppins(fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                  child: Icon(
                                    Icons.remove,
                                    size: 19,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white)),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
