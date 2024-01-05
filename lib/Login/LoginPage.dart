import 'package:CalorieMate/regist/registPage.dart';
import 'package:flutter/material.dart';
import 'BodyLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // Ubah tinggi AppBar di sini
        child: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
                color: Color.fromARGB(255, 11, 0, 54),
                fontFamily: "Ken",
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 11, 0, 54)),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
                pageBuilder: (_, __, ___) => registPage(),
              ),
              );
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 60),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: BodyLogin(),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 40, left: 30, right: 30),
                child: Text(
                  "By continuing, you agree to CalorieMate’s Terms & Conditions and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Ken",
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}