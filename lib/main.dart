import 'package:flutter/material.dart';
//import 'package:praktikum_firebase/first_screen.dart';
import 'package:praktikum_firebase/login_page.dart';
//import 'package:praktikum_firebase/first_screen_email.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}