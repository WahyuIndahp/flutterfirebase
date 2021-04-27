import 'package:flutter/material.dart';
import 'package:praktikum_firebase/login_page.dart';
import 'package:praktikum_firebase/sign_in.dart';

class EmailScreen extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                padding: EdgeInsets.all(5),
                child: Text(
                  "Selamat Kamu Berhasil Login Dengan Email !",
                  style: TextStyle(fontSize: 28, color: Colors.purple[900], fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.network("https://cdn.pixabay.com/photo/2019/02/19/19/45/thumbs-up-4007573_960_720.png",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
              ),
              SizedBox(height: 15),
              RaisedButton(
                onPressed: () {
                  signOutEmail();
 
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) 
{return LoginPage();}), ModalRoute.withName('/'));
              },
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ), 
    );
  }
}