import 'package:flutter/material.dart';

class UsrPwIncorect {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0,),
            ),
          ),
          contentPadding: EdgeInsets.all(10.0,),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Username/Password are Incorect",
              style: TextStyle(
                color: Colors.red,
                  fontSize: 15,
                  fontFamily: "Ken",
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        );
      },
    );
  }
}