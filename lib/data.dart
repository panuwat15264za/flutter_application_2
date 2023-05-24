class ShoeData {
  String imagePath;
  String shoeName;
  double price;

  ShoeData({
    required this.imagePath,
    required this.shoeName,
    required this.price,
  });
}

List<ShoeData> shoes = [
  ShoeData(
    imagePath: 'assets/images/Air-Jordan-1-Retro-High-OG.png',
    shoeName: 'Air-Jordan-1-Retro-High-OG',
    price: 76,
  ),
  ShoeData(
    imagePath: 'assets/images/Jordan-1-KO.png',
    shoeName: 'Jordan-1-KO',
    price: 78,
  ),
  ShoeData(
    imagePath: 'assets/images/Nike-Air-Force-1-_07-LX.png',
    shoeName: 'Nike-Air-Force-1-_07-LX',
    price: 50,
  ),
  ShoeData(
    imagePath: 'assets/images/Nike-Air-Force-1-_07-Premium.png',
    shoeName: 'Nike-Air-Force-1-_07-Premium',
    price: 58,
  ),
  ShoeData(
    imagePath: 'assets/images/Nike-Air-Max-97.png',
    shoeName: 'Nike-Air-Max-97',
    price: 63,
  ),
  ShoeData(
    imagePath: 'assets/images/Nike-Air-Max-97-OG.png',
    shoeName: 'Nike-Air-Max-97-OG',
    price: 34,
  ),
  ShoeData(
    imagePath: 'assets/images/Nike-Air-Zoom-G.T.-Run',
    shoeName: 'Shoe 3',
    price: 96,
  ),
  ShoeData(
    imagePath: 'assets/images/Nike-Air-Zoom-SuperRep-3',
    shoeName: 'Shoe 3',
    price: 65,
  ),
  // Add more shoe data as needed
];
