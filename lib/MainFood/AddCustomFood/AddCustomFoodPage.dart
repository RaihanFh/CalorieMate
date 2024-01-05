import 'package:CalorieMate/MainFood/AddCustomFood/bodyCustFood.dart';
import 'package:flutter/material.dart';

class AddCustomFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // Ubah tinggi AppBar di sini
        child: AppBar(
          title: Text(
            "Set Custom Food",
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
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: bodyCustFood(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
