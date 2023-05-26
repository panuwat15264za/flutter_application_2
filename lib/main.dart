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
          textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
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
  var shoeList = returnShoesType(0);
  void setIndex(int tosetIndex) {
    index = tosetIndex;
    shoeList = returnShoesType(index);
    print(index);
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

  bool isChanged0 = true;
  bool isChanged1 = true;
  bool isChanged2 = true;
  bool isChanged3 = true;

  var _list = [false, false, false, false];

  Widget sneakerSeriesBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      //width: MediaQuery.of(context).size.width * 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(
                  _list[0] ? Colors.black : Colors.transparent),
              backgroundColor: MaterialStateProperty.all<Color>(
                  _list[0] ? Colors.orange : Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.orange,
                    width: 3,
                  ),
                ),
              ),
            ),
            child: Text('nike air max',
                style: TextStyle(
                    fontSize: 20,
                    color: _list[0] ? Colors.white : Colors.orange)),
            onPressed: () {
              setState(() {
                for (int i = 0; i < _list.length; i++) {
                  if (i == 0)
                    _list[i] = true;
                  else
                    _list[i] = false;
                }
              });
              final appstate = Provider.of<MyAppState>(context, listen: false);
              appstate.setIndex(0);
            },
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(
                  _list[1] ? Colors.black : Colors.transparent),
              backgroundColor: MaterialStateProperty.all<Color>(
                  _list[1] ? Colors.orange : Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.orange,
                    width: 3,
                  ),
                ),
              ),
            ),
            child: Text('nike air max',
                style: TextStyle(
                    fontSize: 20,
                    color: _list[1] ? Colors.white : Colors.orange)),
            onPressed: () {
              setState(() {
                for (int i = 0; i < _list.length; i++) {
                  if (i == 1)
                    _list[i] = true;
                  else
                    _list[i] = false;
                }
              });
              final appstate = Provider.of<MyAppState>(context, listen: false);
              appstate.setIndex(1);
            },
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(
                  _list[2] ? Colors.black : Colors.transparent),
              backgroundColor: MaterialStateProperty.all<Color>(
                  _list[2] ? Colors.orange : Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.orange,
                    width: 3,
                  ),
                ),
              ),
            ),
            child: Text('nike air max',
                style: TextStyle(
                    fontSize: 20,
                    color: _list[2] ? Colors.white : Colors.orange)),
            onPressed: () {
              setState(() {
                for (int i = 0; i < _list.length; i++) {
                  if (i == 2)
                    _list[i] = true;
                  else
                    _list[i] = false;
                }
              });
              final appstate = Provider.of<MyAppState>(context, listen: false);
              appstate.setIndex(2);
            },
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(
                  _list[3] ? Colors.black : Colors.transparent),
              backgroundColor: MaterialStateProperty.all<Color>(
                  _list[3] ? Colors.orange : Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.orange,
                    width: 3,
                  ),
                ),
              ),
            ),
            child: Text('nike air max',
                style: TextStyle(
                    fontSize: 20,
                    color: _list[3] ? Colors.white : Colors.orange)),
            onPressed: () {
              setState(() {
                for (int i = 0; i < _list.length; i++) {
                  if (i == 3)
                    _list[i] = true;
                  else
                    _list[i] = false;
                }
              });
              final appstate = Provider.of<MyAppState>(context, listen: false);
              appstate.setIndex(3);
            },
          ),
        ],
      ),
    );
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
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
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
    var shoeList = returnShoesType(selectedIndex);
    // switch (selectedIndex) {
    //   case 0:
    //     page = Page1();
    //     break;
    //   case 1:
    //     page = Page2();
    //     break;
    //   case 2:
    //     page = Page3();
    //     break;
    //   case 3:
    //     page = Page4();
    //     break;
    // }
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
    //เพิ่มใหม่ภัทร
    return Scaffold(
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(
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
      //main BG
      backgroundColor: Color(0xFFD3D3D3),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.2,
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
          child: sneakerSeriesBar(),
        ),
        Container(
          child: Page1(),
        )
      ])),
    );
  }
}

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  bool isSelected = false;

  //สร้างตัวแปร isSelected เพื่อเก็บสถานะการเลือก
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var shoeList = appState.shoeList;
    // for (var i = 0; i < shoeList.length; i++) {
    //   print("Recieve" + shoeList[i].shoeName);
    // }

    return Container(
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // padding: const EdgeInsets.symmetric(horizontal: 30),

        itemCount: shoeList.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
              onTap: () {
                // ดำเนินการที่คุณต้องการเมื่อคลิกที่รูป
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShoesScreen(shoe: shoes[index])),
                );
              },
              child: Card(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset(
                              shoeList[index].imagePath,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            shoeList[index].shoeName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                shoeList[index].price.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0,
          //mainAxisExtent: 100,
        ),
      ),
    );
  }
}

// class Page12 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var current = appState.index;
//     var shoeList = appState.shoeList;

//     return Container(
//       color: Colors.amber,
//       child: GridView.builder(
//         physics: ScrollPhysics(),
//         shrinkWrap: true,
//         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//         // padding: const EdgeInsets.symmetric(horizontal: 30),

//         itemCount: shoeList.length,
//         itemBuilder: (BuildContext ctx, index) {
//           return Card(
//             child: Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(20)),
//               margin: EdgeInsets.all(5),
//               padding: EdgeInsets.all(5),
//               child: Stack(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Expanded(
//                         child: Image.asset(
//                           shoeList[index].imagePath,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       Text(
//                         'Title',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Subtitle',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.0,
//           crossAxisSpacing: 0.0,
//           mainAxisSpacing: 0,
//           //mainAxisExtent: 100,
//         ),
//       ),
//     );
//   }
// }
