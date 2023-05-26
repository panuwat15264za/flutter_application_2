import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartScreen.dart';
import 'accountScreen.dart';
import 'data.dart';
import 'shoesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: ShoesScreen(shoe: shoes[0]), // ส่งข้อมูลรองเท้าเข้าไปใน ShoesScreen
  //   );
  // }
}

class MyAppState extends ChangeNotifier {
  var index = 0;

  void setIndex(int tosetIndex) {
    index = tosetIndex;
    notifyListeners();
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

  var selectedIndex = 0;

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoesScreen(shoe: shoes[0])),
                  );
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
    //เพิ่มใหม่ภัทร
    Widget page = Page1();
    switch (selectedIndex) {
      case 0:
        page = Page1();
        break;
      case 1:
        page = Page2();
        break;
      case 2:
        page = Page3();
        break;
      case 3:
        page = Page4();
        break;
    }
    //เพิ่มใหม่ภัทร
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
    //เพิ่มใหม่ภัทร
    int selectedValue = 0;
    //เพิ่มใหม่ภัทร
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
                    if (index == 1) {
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
        Container(
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF9900),
                          padding: EdgeInsets.all(5),
                        ),
                        child: Text('nike air force',
                            style: TextStyle(fontSize: 10)),
                        onPressed: () async {
                          setState(() {
                            selectedIndex = 0;
                            print(0);
                          });
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           ShoesScreen(shoe: shoes[0])),
                          // );
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF9900),
                          padding: EdgeInsets.all(5),
                        ),
                        child: Text('nike air max',
                            style: TextStyle(fontSize: 10)),
                        onPressed: () async {
                          setState(() {
                            selectedIndex = 1;
                            print(1);
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF9900),
                          padding: EdgeInsets.all(5),
                        ),
                        child: Text('nike vapor max',
                            style: TextStyle(fontSize: 10)),
                        onPressed: () async {
                          setState(() {
                            selectedIndex = 2;
                            print(2);
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF9900),
                          padding: EdgeInsets.all(5),
                        ),
                        child: Text('nike vapor max',
                            style: TextStyle(fontSize: 10)),
                        onPressed: () async {
                          setState(() {
                            selectedIndex = 3;
                            print(3);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: page,
                  ),
                )
              ],
            ),
          ),
        )
      ])),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var current = appState.index;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var current = appState.index;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var current = appState.index;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var current = appState.index;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
