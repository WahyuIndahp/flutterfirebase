import 'package:flutter/material.dart';
import 'package:praktikum_firebase/login_page.dart';
import 'package:praktikum_firebase/sign_in.dart';

class EmailScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.account_box_rounded),
          onPressed: (){},
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), 
              onPressed: () {
                signOutEmail();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) 
                {return LoginPage();}), ModalRoute.withName('/'));},
          ),
        ],
        title: Text("Halaman Home"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[100],
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient( 
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue[200], Colors.blue[400]],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Kamu Login Dengan Email !",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.height - 50,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Sewa Barang', 'assets/daftar_barang.png',),
                  _buildCard('Keranjang', 'assets/cart.jpg'),
                  _buildCard('Deskripsi Barang', 'assets/alat.jpg'),
                  _buildCard('CRUD Barang', 'assets/alat.jpg'),
                  _buildCard('Info Toko', 'assets/store.png'),
                ],
              ),
            )
          ],
        ),
      ), 
    );
  }
  Widget _buildCard(String fitur, String imgPath,){
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(
                color: Colors.grey,
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.cyan,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Hero(
                tag: imgPath, 
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath,),fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0,),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Text(fitur, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}