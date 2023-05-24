import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

import 'accountScreen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // ปุ่มย้อนกลับ
          },
        ),
      ),
      body: Container(
        // พื้นที่แสดงเมื่อกดแอดข้อมูลเข้าตระกร้า
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub total:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'ราคาที่แสดง',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  // โค้ดสำหรับการชำระเงิน
                },
                child: Text('Payment'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
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
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountScreen(
                      name: 'text',
                      phone: 'text',
                      email: 'text',
                      password: 'text',
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
      // bottomNavigationBar: GNav(gap: 8, tabs: const [
      //   GButton(
      //     icon: Icons.home,
      //     text: 'Home',
      //   ),
      //   GButton(
      //     icon: Icons.shopping_cart,
      //     text: 'Cart',
      //   ),
      //   GButton(
      //     icon: Icons.account_circle,
      //     text: 'Account',
      //   )
      // ]),
    );
  }
}
