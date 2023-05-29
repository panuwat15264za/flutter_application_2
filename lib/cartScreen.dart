import 'package:flutter/material.dart';

import 'data.dart';

class ScreenCart {
  final String shoeName;
  final String imagePath;
  final double price;
  int quantity;

  ScreenCart({
    required this.shoeName,
    required this.imagePath,
    required this.price,
  }) : quantity = 1;
}

class CartScreen extends StatelessWidget {
  final ShoeData shoe;
  final ScreenCart cartScreen;

  CartScreen({required this.shoe, required this.cartScreen});

  void _addToCart(BuildContext context, ShoeData shoe, ScreenCart cartScreen) {
    ScreenCart cartItem = ScreenCart(
      shoeName: shoe.shoeName,
      imagePath: shoe.imagePath,
      price: shoe.price,
    );
    cartScreen.addToCart(cartItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ... Existing code

    return Scaffold(
      // ... Existing code
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            _addToCart(context, shoe, cartScreen);
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
