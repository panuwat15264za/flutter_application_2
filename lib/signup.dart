import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'signin.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () async {
                  String? check = await signupReq(
                      nameController,
                      usernameController,
                      phoneNumberController,
                      passwordController,
                      emailController);
                  if (check == "Authentication successful") {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => SignInPage(),
                      ),
                    );
                  } else {
                    //กรณีที่ไม่ได้ ให้ alart ว่าผิด
                  }
                },
                child: Text('SignUp')),
          ],
        ),
      ),
    );
  }
}

String? currentEmail;

Future<String> signupReq(name, username, password, phone, email) async {
  final res = await http.post(Uri.parse("${_localhost()}/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name.text,
        'username': username.text,
        'password': password.text,
        'phone': phone.text,
        'email': email.text,
      }));
  currentEmail = email.text;
  return res.body;
}

String _localhost() {
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:3000/';
  } else {
    return 'http://localhost:3000/';
  } // for iOS simulator
}
