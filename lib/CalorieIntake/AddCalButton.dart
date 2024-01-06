import 'package:CalorieMate/MainFood/MainFoodPage.dart';
import 'package:flutter/material.dart';

class AddCalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.zero,
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
                pageBuilder: (_, __, ___) => MainFoodPage(),
              ),
            );
          },
          child: Text(
            '+',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Ken",
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 11, 0, 54)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
