import 'package:animate_do/animate_do.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:razza_app/View/Screens/User_Screens/Home.dart';
import 'package:razza_app/View/Screens/User_Screens/cart.dart';
import 'package:razza_app/View/Screens/User_Screens/profile.dart';
import 'package:razza_app/View/Screens/User_Screens/search.dart';

class BottomBarScreens extends StatefulWidget {
  int screen;
  BottomBarScreens({super.key, required this.screen});

  @override
  State<BottomBarScreens> createState() => _BottomBarScreensState();
}

class _BottomBarScreensState extends State<BottomBarScreens> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
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
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FadeInUp(
        child: FlashyTabBar(
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
              icon: Icon(Icons.shopping_bag_outlined),
              title: Text('Cart'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.person),
              title: Text('Me'),
            ),
          ],
        ),
      ),
    );
  }
}
