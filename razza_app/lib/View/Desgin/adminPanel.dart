import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:razza_app/Model/auth.dart';
import 'package:razza_app/Model/firestore.dart';
import 'package:razza_app/View/Desgin/cateLoading.dart';
import 'package:razza_app/View/Desgin/color.dart';
import 'package:razza_app/View/Screens/Admin_Screens/Add_Product_Screen.dart';
import 'package:razza_app/View/Screens/Admin_Screens/manageProduct.dart';
import 'package:razza_app/View/Screens/User_Screens/Home.dart';
import 'package:razza_app/View/Screens/User_Screens/cart.dart';
import 'package:razza_app/View/Screens/User_Screens/profile.dart';
import 'package:razza_app/View/Screens/User_Screens/search.dart';
import 'package:razza_app/View/Screens/signup-in/Email/signIn.dart';

import '../Screens/Admin_Screens/orderScreen_admin.dart';

class AdminPanel extends StatefulWidget {
  int screen;
   AdminPanel({super.key, required this.screen});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  Auth auth = Auth();
  Style style = Style();

  int _selectedIndex = 0;

  List<Widget> tabItems = [
    HomeScreen(),
    ProductManagement(),
    AddProduct(),
    Admin_order_Screen()
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                  color: style.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        spreadRadius: -3,
                        color: Color.fromARGB(255, 183, 183, 183))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.power_settings_new_outlined,
                  color: Colors.white,
                ),
              )),
          onTap: () {
            auth.logOut(context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ), (route) => false);
          },
        ),
      ),
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.edit),
            title: Text('Management'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.add),
            title: Text('Add product'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.list_rounded),
            title: Text('Orders'),
          ),
        ],
      ),
    );
  }
}
