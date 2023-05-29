import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () async {
                  String? check = await signinReq(
                    _usernameController,
                    _passwordController,
                    _emailController,
                  );
                  if (check == "Authentication successful") {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => MyHomePage(currentUsername : _usernameController.text),
                      ),
                    );
                  }
                  // } else {

                  //   //กรณีที่ไม่ได้ ให้ alart ว่าผิด
                  // }
                },
                child: Text('SignIn')),
          ],
        ),
      ),
    );
  }
}

String? currentEmail;

Future<String> signinReq(
    _usernameController, _passwordController, _emailController) async {
  final res = await http.post(Uri.parse("${_localhost()}/signin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameController.text,
        'password': _passwordController.text,
        'email': _emailController.text,
      }));
  currentEmail = _emailController.text;
  return res.body;
}

String _localhost() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:3000';
  } else {
    return 'http://localhost:3000';
  } // for iOS simulator
}
