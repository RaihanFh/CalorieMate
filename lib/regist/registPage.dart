import 'package:flutter/material.dart';
import 'BodyRegist.dart';

class registPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(
            color: Color.fromARGB(255, 11, 0, 54),
            fontFamily: "Ken",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 10,
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
                child: BodyRegist(),
              ),
            ),
            SizedBox(height: 10), // Tambahkan jarak sebelum teks "Halo"
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
