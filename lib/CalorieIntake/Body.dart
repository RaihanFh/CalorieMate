import 'package:CalorieMate/MainFood/MainFoodPage.dart';
import 'package:flutter/material.dart';
import 'package:CalorieMate/CalorieIntake/FoodDetailView.dart';

class Bodyy extends StatefulWidget {
  @override
  State<Bodyy> createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> {
  int cal = 125, calLimit = 100;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 105,
                        height: 105,
                        child: CircularProgressIndicator(
                          value: (calLimit-cal) <= 0 ? 0 : cal / calLimit,
                          strokeWidth: 10,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 11, 0, 54)),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "${calLimit-cal}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "LIMIT"
                          ),
                          Text(
                            "CALORIES"
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 11, 0, 54), 
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 6.7,),
                      Text(
                        'Limit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$calLimit cal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 50,
                margin: EdgeInsets.zero,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // Check kondisi pertama
                      if (cal >= calLimit) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Limit Calorie has Reached"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                     Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration: Duration.zero,
                                        pageBuilder: (_, __, ___) => MainFoodPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Kondisi kedua: navigasi ke halaman MainFoodPage
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (_, __, ___) => MainFoodPage(),
                          ),
                        );
                      }
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
                      //padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 10, vertical: 15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 11, 0, 54),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 6.7,),
                      Text(
                        'Consumed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$cal cal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // FoodDetailView(),
          // FoodDetailView(),
          // FoodDetailView(),
          // FoodDetailView(),
        ],
      ),
    );
  }
}