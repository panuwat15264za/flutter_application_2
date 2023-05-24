import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'accountScreen.dart';
import 'cartScreen.dart';

class ShoesScreen extends StatefulWidget {
  @override
  _ShoesScreenState createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    Container(
      width: 1080,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 86),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 612.75,
            height: 530.81,
            child: FlutterLogo(size: 530.8125),
          ),
        ],
      ),
    ),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // เพิ่มโค้ดที่ต้องการเมื่อกดปุ่ม SAVE
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: Color(0xFF949499),
                textColor: Colors.orange,
                iconActiveColor: Colors.orange,
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
                iconColor: Color(0xFF949499),
                textColor: Colors.orange,
                iconActiveColor: Colors.orange,
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Account',
                iconColor: Color(0xFF949499),
                textColor: Colors.orange,
                iconActiveColor: Colors.orange,
              ),
            ],
            backgroundColor: Colors.white,
            activeColor: Colors.orange,
          ),
        ),
      ),
    );
  }
}
