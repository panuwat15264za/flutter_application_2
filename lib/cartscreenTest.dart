import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;
  final double price;
  int quantity;

  Product({required this.name, required this.image, required this.price})
      : quantity = 1;
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Product> _cartItems = [
    Product(
      name: "Product 1",
      image: "assets/images/Philodendron Birkin.png",
      price: 9.99,
    ),
    Product(
      name: "Product 2",
      image: "assets/images/Philodendron Birkin.png",
      price: 19.99,
    ),
    // Add more products as needed
  ];

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              'Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
            height: 300,
            width: 500,
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    _cartItems[index].image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(_cartItems[index].name),
                  subtitle:
                      Text('\$${_cartItems[index].price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            _cartItems.removeAt(index);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _cartItems[index].quantity += 1;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Total Price: \$${getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Implement the "Check out" functionality
                },
                child: Text(
                  'Check out',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ShoppingCartPage(),
  ));
}
