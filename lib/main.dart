import 'package:flutter/material.dart';
import 'package:flutter_application_2/signin.dart';
import 'package:flutter_application_2/signup.dart';
import 'package:provider/provider.dart';

import 'CartScreen.dart';
import 'accountScreen.dart';
import 'data.dart';
import 'shoesScreen.dart';

import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

String _localhost() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:3000';
  } else {
    return 'http://localhost:3000';
  } // for iOS simulator
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
        home: SignupPage(),
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
  final String currentUsername;
  MyHomePage({super.key, required this.currentUsername});

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
  
    Item item = Item();

  Future<Item> getData() async{
  final response = await http.post(Uri.parse(_localhost() + "/getDB"),
  headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': widget.currentUsername,
      }),);
      var responseData = json.decode(response.body);
      Item item = Item(
      id: responseData["0"]["id"],
      name: responseData["0"]["name"],
      username: widget.currentUsername,
      email: responseData["0"]["email"],
      phone: responseData["0"]["phone"],
      password: responseData["0"]["password"],);

  return item;
}
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {item = await getData();});
    super.initState();
  }

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

  var _list = [true, false, false, false];

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
            child: Text('Nike air force',
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
            child: Text('Nike air max',
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
            child: Text('Nike air jordan',
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
            child: Text('Nike air zoom',
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

  Widget buildProductContainer(ShoeData data, int index) {
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
                            data.shoeName,
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
                            data.price.toString(),
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
                        builder: (context) => ShoesScreen(shoe: data)),
                  );
                },
                child: Container(
                  width: 179,
                  height: 265,
                  child: Image.asset(
                    data.imagePath, // เปลี่ยนเป็นพาธรูปภาพที่คุณต้องการ
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

    // List<Map<String, String>> productList = [
    //   {
    //     'title': 'Nike Air Force',
    //     'imageAsset': 'assets/images/Nike-Air-Force-1-_07-LX.png',
    //   },
    //   {
    //     'title': 'Nike-Air-Force-1-_07-Premium',
    //     'imageAsset': 'assets/images/Nike-Air-Force-1-_07-Premium.png',
    //   },
    //   {
    //     'title': 'Nike-Air-Max-97-OG',
    //     'imageAsset': 'assets/images/Nike-Air-Max-97-OG.png',
    //   },
    // ];
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
                            name: item.name.toString(),
                            phone: item.phone.toString(),
                            email: item.email.toString(),
                            password: item.password.toString(),
                            currentUsername: widget.currentUsername,
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onHorizontalDragUpdate: handleScrollUpdate,
                      onHorizontalDragEnd: handleScrollEnd,
                      child: buildProductContainer(shoes[index], index),
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
                      builder: (context) => ShoesScreen(shoe: shoeList[index])),
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
