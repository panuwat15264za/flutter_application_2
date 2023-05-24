import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

import 'cartScreen.dart';

class AccountScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60,
                // รูปภาพที่เลือก
                backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
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
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          selectedItemColor: Colors.orange,
          unselectedItemColor: Color(0xFF949499),
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            } else if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            }
          },
        ),
      ),
    );
  }
}
