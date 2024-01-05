import 'package:flutter/material.dart';

class ShowDataAlert3 {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0,),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 10.0,),
          title: Text(
            "Forgot Password",
            style: TextStyle(
              color: Color.fromARGB(255, 11, 0, 54),
                fontSize: 20,
                fontFamily: "Ken",
            ),
          ),
          content: Container(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "   New Password",
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 0, 54),
                          fontSize: 15,
                          fontFamily: "Ken",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 11, 0, 54)),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "   Repeat New Password",
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 0, 54),
                          fontSize: 15,
                          fontFamily: "Ken",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 11, 0, 54)),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color.fromARGB(255, 11, 0, 54)),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        print("hi"); //GGAAANTIII FUNNCC NYA DISINII
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Ken",
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 11, 0, 54)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}