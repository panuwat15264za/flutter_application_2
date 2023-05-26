import 'package:flutter/material.dart';

class ShoeData {
  String imagePath;
  String shoeName;
  String shoeDescription;
  int shoeSeries;
  double price;
  List<Color> colors;

  ShoeData({
    required this.shoeSeries,
    required this.imagePath,
    // required this.Shoe,
    required this.shoeName,
    required this.shoeDescription,
    required this.price,
    required this.colors,
  });
}

List<ShoeData> returnShoesType(int param) {
  List<ShoeData> shoesList = List.empty(growable: true);
  for (int i = 0; i < shoes.length; i++) {
    print("try" +
        shoes[i].shoeName +
        " Shoe series is " +
        shoes[i].shoeSeries.toString());
    if (shoes[i].shoeSeries == param) {
      shoesList.add(shoes[i]);
      print("add" + shoes[i].shoeName);
    }
  }
  if (shoesList == null) {
    return shoes;
  }
  return shoesList;
}

List<ShoeData> shoes = [
  ShoeData(
    shoeSeries: 1,
    imagePath: 'assets/images/Nike-Air-Force-1-_07-LX.png',
    shoeName: 'Air-Jordan-1-Retro-High-OG',
    shoeDescription: 'รองเท้าดี',
    price: 76,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  ShoeData(
    shoeSeries: 1,
    imagePath: 'assets/images/Jordan-1-KO.png',
    shoeName: 'Jordan-1-KO',
    shoeDescription: 'รองเท้าดี',
    price: 78,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  ShoeData(
    shoeSeries: 0,
    imagePath: 'assets/images/Nike-Air-Force-1-_07-LX.png',
    shoeName: 'Nike-Air-Force-1-_07-LX',
    shoeDescription: 'รองเท้าดี',
    price: 50,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  ShoeData(
    shoeSeries: 0,
    imagePath: 'assets/images/Nike-Air-Force-1-_07-Premium.png',
    shoeName: 'Nike-Air-Force-1-_07-Premium',
    shoeDescription: 'รองเท้าดี',
    price: 58,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  ShoeData(
    shoeSeries: 1,
    imagePath: 'assets/images/Nike-Air-Max-97.png',
    shoeName: 'Nike-Air-Max-97',
    shoeDescription: 'รองเท้าดี',
    price: 63,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  ShoeData(
    shoeSeries: 1,
    imagePath: 'assets/images/Nike-Air-Max-97-OG.png',
    shoeName: 'Nike-Air-Max-97-OG',
    shoeDescription: 'รองเท้าดี',
    price: 34,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  ShoeData(
    shoeSeries: 3,
    imagePath: 'assets/images/Nike-Air-Zoom-G.T.-Run.png',
    shoeName: 'Nike-Air-Zoom-G.T.-Run',
    shoeDescription: 'รองเท้าดี',
    price: 96,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  ShoeData(
    shoeSeries: 3,
    imagePath: 'assets/images/Nike-Air-Zoom-SuperRep-3',
    shoeName: 'Shoe 3',
    shoeDescription: 'รองเท้าดี',
    price: 65,
    colors: [
      Colors.red,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.orange
    ],
  ),
  // Add more shoe data as needed
];
