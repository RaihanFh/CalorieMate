//import 'package:CalorieMate/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'BodyBMIDetail.dart';

class BMIDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), 
        child: AppBar(
          title: Text(
            "BMI Details",
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
              Navigator.pop(context,);
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: BodyBMIDetail(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
