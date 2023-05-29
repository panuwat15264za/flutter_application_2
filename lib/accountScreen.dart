import 'package:flutter/material.dart';
import 'package:flutter_application_2/CartScreen.dart';
import 'package:flutter_application_2/signin.dart';

import 'package:flutter_application_2/signup.dart';
import 'main.dart';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AccountScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String currentUsername;

  const AccountScreen({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.currentUsername,
  });

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class Item {
  final int? id;
  final String? name;
  final String? username;
  final String? phone;
  final String? email;
  final String? password;

  Item({
    this.id,
    this.name,
    this.username,
    this.phone,
    this.email,
    this.password,
  });
}

class _AccountScreenState extends State<AccountScreen> {
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
      name: responseData["0"]["name"].toString(),
      username: responseData["0"]["username"].toString(),
      email: responseData["0"]["email"].toString(),
      phone: responseData["0"]["phone"].toString(),
      password: responseData["0"]["password"].toString(),);

  return item;
}
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {item = await getData();});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Account'),
            backgroundColor: Colors.orange,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        //backgroundImage:
                        //NetworkImage('https://example.com/avatar.jpg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Name : ${widget.name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10), //ระยะห่างช่อง
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 20,
                        width: 200,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Phone : ${widget.phone}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10), //ระยะห่างช่อง
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 2,
                        width: 200,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Email : ${widget.email}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 15,
                        width: 200,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 10,
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
                      MaterialPageRoute(builder: (context) => MyHomePage(currentUsername : widget.currentUsername)),
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
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupPage()));
          return true;
        });
  }
  
}
String _localhost() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:3000';
  } else {
    return 'http://localhost:3000';
  } // for iOS simulator
}
