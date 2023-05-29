import 'package:flutter/material.dart';

import 'CartScreen.dart';
import 'data.dart';

class ShoesScreen extends StatelessWidget {
  final ShoeData shoe;

  ShoesScreen({required this.shoe});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    //
    ValueNotifier<bool> showDescription = ValueNotifier<bool>(false);
    //
    List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
    int selectedColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              isFavorite = !isFavorite;
              // เพิ่มโค้ดสำหรับการเปลี่ยนสถานะรายการโปรดที่นี่
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                shoe.imagePath,
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              shoe.shoeName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${shoe.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Color:',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    // color: shoe.colors,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Size:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            ButtonRow(),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      showDescription.value = !showDescription.value;
                    },
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: showDescription,
                    builder: (context, value, child) {
                      return value
                          ? Text(
                              shoe.shoeDescription,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )
                          : SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          },
          icon: Icon(Icons.shopping_cart),
          label: Text('ADD TO CART'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int size = 36; size <= 40; size++)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = size;
              });
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: selectedSize == size ? Colors.blue : Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  size.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
