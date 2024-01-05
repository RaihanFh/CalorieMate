import 'package:flutter/material.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:CalorieMate/services/Database.dart';

class Bodyy extends StatefulWidget {
  @override
  State<Bodyy> createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(email: user.email).uData,
        builder: (context, snapshot) {
          UserData userD = snapshot.data!;
          return Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 11, 0, 54),
                      radius: 55,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(userD.img!),
                        radius: 50,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "${userD.name}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 0, 54),
                          fontFamily: "Ken",
                          fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left:
                                  1), // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "ABOUT ME",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                            Text(
                              "${userD.email}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                            Text(
                              "${userD.gender}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Age",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                            Text(
                              "${UserData.calculateAge(userD.birthdate!)}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: EdgeInsets
                              .zero, // Atur jarak kiri sebesar 8, sesuaikan sesuai kebutuhan
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "BMI INFORMATIONS",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Current Weight",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                            Text(
                              "${userD.weight} kg",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Current Height",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                            Text(
                              "${userD.height} cm",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "BMI Result",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                            Text(
                              "${userD.bmi!.BMIScore.toStringAsFixed(1)}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Weight Status",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                            Text(
                              "${BMI_Data.getLevel(userD.bmi!.BMIScore)}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ],
            ),
          );
        });
  }
}
