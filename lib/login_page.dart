import 'package:flutter/material.dart';
import 'package:praktikum_firebase/sign_in.dart';
import 'package:praktikum_firebase/first_screen.dart';
import 'package:praktikum_firebase/first_screen_email.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = _isHidePassword;
    });
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.blue, BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(image: AssetImage("assets/logo.png"), height: 250.0),
              SizedBox(height: 5), 
              _signInButton(),
              Container (
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 60,
                child: TextField(
                  style:TextStyle(fontSize: 20.0, color:Colors.grey[700], fontWeight: FontWeight.bold),
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.blue,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(30)),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)
                  ),
                  onChanged: (value) {  
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 60,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isHidePassword,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(30)),
                    contentPadding: EdgeInsets.all(15),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglePasswordVisibility();
                      },
                      child: Icon(
                        _isHidePassword ? Icons.visibility_off : Icons.visibility,
                        color: _isHidePassword ? Colors.white : Colors.white,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(30)),
                    hintStyle: TextStyle(color: Colors.blue),
                      hintText: 'Password'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 6) {
                      return 'Password minimum 6(six) characters!';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:5.0, bottom:5.0),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'SIGN UP',
                          textScaleFactor:1.5,
                        ),
                        onPressed: () async {
                          signUp(emailController.text, passwordController.text).then((result) {
                            if (result != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EmailScreen();
                                  },
                                ),
                              );
                            }
                          },);
                        },
                      ),
                    ),
                    SizedBox(
                      width : 15,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'SIGN IN',
                          textScaleFactor:1.5,
                        ),
                        onPressed: () async {
                          signIn(emailController.text, passwordController.text).then((result) {
                            if (result != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EmailScreen();
                                  },
                                ),
                              );
                            }
                          },);
                        }
                      )
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'SignIn With Google',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),          
      ),
    );
  }
}