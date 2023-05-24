import 'package:flutter/material.dart';

import 'CartScreen.dart';
import 'accountScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountScreen(
        name: 'text',
        phone: 'text',
        email: 'text',
        password: 'text',
      ), //เลือกรันหน้าที่กำหนด
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  bool isSelected = false; //สร้างตัวแปร isSelected เพื่อเก็บสถานะการเลือก

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;
  bool isSelected = false;

  //เปิด_buildGridItem
  Widget _buildGridItem(String imagePath, String title, String price) {
    return Container(
      width: 144,
      height: 192,
      child: Material(
        color: Color(0xFFFFFFFF),
        elevation: 5,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              width: 96,
              height: 83,
              child: Image.asset(imagePath),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: Color(0xff171717),
                fontSize: 14,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 7),
            Text(
              price,
              style: TextStyle(
                color: Color(0xff171717),
                fontSize: 12,
                fontFamily: "Sarabun",
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  //ปิด_buildGridItem

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  void handleSearch() {
    String searchText = _searchController.text;
    // ดำเนินการที่คุณต้องการเมื่อกดปุ่มค้นหา
    print('Search clicked: $searchText');
  }

  void handleScrollUpdate(DragUpdateDetails details) {
    setState(() {
      _scrollOffset -= details.delta.dx;
    });
  }

  void handleScrollEnd(DragEndDetails details) {
    if (_scrollOffset.abs() > 100) {
      if (_scrollOffset > 0) {
        _scrollController.animateTo(
          _scrollController.offset + 200,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 300),
        );
      } else {
        _scrollController.animateTo(
          _scrollController.offset - 200,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 300),
        );
      }
    }

    setState(() {
      _scrollOffset = 0;
    });
  }

  Widget buildProductContainer(
    String title,
    String imageAsset,
    int index,
  ) {
    List<Color> boxColors = [
      Color(0xFF003366),
      Color(0xFF004D99),
      Color(0xFF0066CC),
    ];

    Color boxColor = boxColors[index % boxColors.length];

    return Container(
      width: 320.0,
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 291,
                height: 155,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(16),
                //   color: Color(0xFF003366),
                // ),
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 41,
                  top: 1,
                  bottom: 29,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 152,
                          height: 27,
                          child: Text(
                            "Nike Air Force",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 236,
                          height: 47,
                          child: Text(
                            "Nike Air Force 1 \nLow SP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 152,
                          height: 27,
                          child: Text(
                            "฿ 3,679",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Sarabun",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  // ดำเนินการที่คุณต้องการเมื่อคลิกที่รูป
                },
                child: Container(
                  width: 179,
                  height: 265,
                  child: Image.asset(
                    imageAsset, // เปลี่ยนเป็นพาธรูปภาพที่คุณต้องการ
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget searchBox = GestureDetector(
      onTap: handleSearch,
      child: Container(
        width: 360.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for Products, Brands...',
                ),
                onEditingComplete: handleSearch,
              ),
            ),
          ],
        ),
      ),
    );

    List<Map<String, String>> productList = [
      {
        'title': 'Nike Air Force',
        'imageAsset': 'assets/images/Nike-Air-Force-1-_07-LX.png',
      },
      {
        'title': 'Nike-Air-Force-1-_07-Premium',
        'imageAsset': 'assets/images/Nike-Air-Force-1-_07-Premium.png',
      },
      {
        'title': 'Nike-Air-Max-97-OG',
        'imageAsset': 'assets/images/Nike-Air-Max-97-OG.png',
      },
    ];

    return Scaffold(
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(30),
                //   topRight: Radius.circular(30),
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 10,
                    // offset: Offset(0, 3),
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
              ));
        },
      ),

      //บนคือ nav ล่างจอ

      backgroundColor: Color(0xFFD3D3D3),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Color(0xFFFF9900),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 30.0,
            left: 15.0,
          ),
          child: Column(
            children: [
              searchBox,
              SizedBox(height: 40.0),
              Container(
                height: 200.0,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onHorizontalDragUpdate: handleScrollUpdate,
                      onHorizontalDragEnd: handleScrollEnd,
                      child: buildProductContainer(
                        productList[index]['title']!,
                        productList[index]['imageAsset']!,
                        index,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //Row Center
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Material(
                      color: widget.isSelected
                          ? Color(0xFFFF9900)
                          : Colors.transparent,
                      elevation: widget.isSelected ? 35 : 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: widget.isSelected
                              ? Color(0xFFFF9900)
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.isSelected = !widget.isSelected;
                          });
                        },
                        child: Container(
                          width: widget.isSelected ? 90 : 80,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          child: Center(
                            child: Text(
                              "AIR FORCE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Material(
                      color: widget.isSelected
                          ? Color(0xFFFF9900)
                          : Colors.transparent,
                      elevation: widget.isSelected ? 35 : 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: widget.isSelected
                              ? Color(0xFFFF9900)
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.isSelected = !widget.isSelected;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          child: Center(
                            child: Text(
                              "AIR JORDAN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Material(
                      color: widget.isSelected
                          ? Color(0xFFFF9900)
                          : Colors.transparent,
                      elevation: widget.isSelected ? 35 : 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: widget.isSelected
                              ? Color(0xFFFF9900)
                              : Colors.orange,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.isSelected = !widget.isSelected;
                          });
                          // ดำเนินการเมื่อแตะที่ AIR MAX
                        },
                        child: Container(
                          width: 80,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          child: Center(
                            child: Text(
                              "AIR MAX",
                              style: TextStyle(
                                color: widget.isSelected
                                    ? Colors.white
                                    : Colors.orange,
                                fontSize: 11,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Material(
                      color: widget.isSelected
                          ? Color(0xFFFF9900)
                          : Colors.transparent,
                      elevation: widget.isSelected ? 35 : 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: widget.isSelected
                              ? Color(0xFFFF9900)
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.isSelected = !widget.isSelected;
                          });
                          // Handle onTap for AIR ZOOM
                        },
                        child: Container(
                          width: 80,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          child: Center(
                            child: Text(
                              "AIR ZOOM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // เพิ่มต่อจากนี้
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                padding: EdgeInsets.fromLTRB(18, 20, 15, 0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(
                    'assets/images/Nike-Air-Force-1-_07-LX.png',
                    'Nike Air Force 1 _07 LX',
                    '฿ 3,590',
                  ),
                  _buildGridItem(
                    'assets/images/Nike-Air-Force-1-_07-Premium.png',
                    'Nike Air Force 1 _07 Premium',
                    '฿ 3,590',
                  ),
                  // เพิ่ม Grid Item อื่น ๆ ตามต้องการ
                ],
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
