import 'package:flutter/material.dart';
//import 'package:firebase/login_page.dart';

class FirstScreen2 extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( 
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Text(
            "Selamat Kamu Berhasil Login",
            style: TextStyle(fontSize: 30, color: Colors.blue[900], fontWeight: FontWeight.bold),
          )
        ),
      ),
    );
  }
} 