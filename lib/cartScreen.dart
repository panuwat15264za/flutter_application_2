import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFDFDF),
        title: Text(
          'Cart',
          textAlign: TextAlign.center, // จัดให้ข้อความตรงกลาง
          style: TextStyle(
            color: Colors.black,
            fontSize: 20, // ปรับขนาดตามที่คุณต้องการ
            fontWeight: FontWeight.bold, // ปรับลักษณะตัวอักษรตามที่คุณต้องการ
          ),
        ),
        centerTitle: true, // จัดให้ข้อความอยู่ตรงกลาง
        leading: IconButton(
          color: Colors.black,
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
    );
  }
}
