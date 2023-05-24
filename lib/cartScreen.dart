import 'package:flutter/material.dart';

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
          ),
      bottomNavigationBar: BottomAppBar(
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
