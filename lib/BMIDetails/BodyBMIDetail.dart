import 'package:CalorieMate/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/services/Database.dart';
import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:CalorieMate/services/varGlobal.dart' as global;

class BodyBMIDetail extends StatefulWidget {
  @override
  State<BodyBMIDetail> createState() => _BodyyState();
}

class _BodyyState extends State<BodyBMIDetail> {
  late UserData userD;
  late double Batas, Bbawah;
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserAccount>(context, listen: false);
    final userDataFuture = DatabaseService(email: user.email).uData.first;

    userDataFuture.then((value) {
      setState(() {
        userD = value;
        Batas = userD.bmi!.HealthyWeight[1];
        Bbawah = userD.bmi!.HealthyWeight[0];
        if (userD.bmi!.UserTarget == 0) {
          _currentSliderValue = (Batas + Bbawah) / 2;
        } else {
          _currentSliderValue = userD.bmi!.UserTarget;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(email: user.email).uData,
      builder: (context, snapshot) {
        userD = snapshot.data!;
        Batas = userD.bmi!.HealthyWeight[1];
        Bbawah = userD.bmi!.HealthyWeight[0];
        double prev;
        if (userD.bmi!.UserTarget == 0) {
          prev = (userD.bmi!.HealthyWeight[0] + userD.bmi!.HealthyWeight[1]) / 2;
        } else {
          prev = userD.bmi!.UserTarget;
        }
        return Padding(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                // BMI GAUGE
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'BMI ${userD.bmi!.BMIScore.toStringAsFixed(1)}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 11, 0, 54),
                          fontFamily: "Ken",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 350,
                      child: SfLinearGauge(
                        minimum: 10,
                        maximum: 45,
                        orientation: LinearGaugeOrientation.horizontal,
                        ranges: [
                          LinearGaugeRange(
                            startValue: 10,
                            endValue: 15.9,
                            color: Color.fromARGB(255, 188, 32, 32),
                          ),
                          LinearGaugeRange(
                            startValue: 16.0,
                            endValue: 16.9,
                            color: Color.fromARGB(255, 211, 136, 136),
                          ),
                          LinearGaugeRange(
                            startValue: 17.0,
                            endValue: 18.4,
                            color: Color.fromARGB(255, 255, 228, 0),
                          ),
                          LinearGaugeRange(
                            startValue: 18.5,
                            endValue: 24.9,
                            color: Color.fromARGB(255, 0, 77, 33),
                          ),
                          LinearGaugeRange(
                            startValue: 25.0,
                            endValue: 29.9,
                            color: Color.fromARGB(255, 255, 228, 0),
                          ),
                          LinearGaugeRange(
                            startValue: 30.0,
                            endValue: 34.9,
                            color: Color.fromARGB(255, 211, 136, 136),
                          ),
                          LinearGaugeRange(
                            startValue: 35.0,
                            endValue: 39.9,
                            color: Color.fromARGB(255, 188, 32, 32),
                          ),
                          LinearGaugeRange(
                            startValue: 40.0,
                            endValue: 45.0,
                            color: Color.fromARGB(255, 137, 23, 23),
                          ),
                        ],
                        markerPointers: <LinearShapePointer>[
                          LinearShapePointer(
                            value: userD.bmi!.BMIScore,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 20,),
              // BMI LEVELS
              Container(
                width: 350,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 188, 32, 32),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Very Severely Underweight',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '<= 15.9',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 211, 136, 136),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Severely Underweight',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '16.0 - 16.9',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 255, 228, 0),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Underweight',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '17.0 - 18.4',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 0, 77, 33),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Normal',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '18.5 - 24.9',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 255, 228, 0),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Overweight',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '25.0 - 29.9',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 211, 136, 136),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Obese Class I',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '30.0 - 34.9',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 188, 32, 32),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Obese Class II',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '35.0 - 39.9',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.5,
                              width: 14.5,
                              color: Color.fromARGB(255, 137, 23, 23),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Obese Class III',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontFamily: "Ken",
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '>= 40.0',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 30),
              // IDEAL WEIGHT
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'your ideal weight ranges from ${userD.bmi?.HealthyWeight[0].toStringAsFixed(1)} - ${userD.bmi?.HealthyWeight[1].toStringAsFixed(1)} kg',
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 0, 54),
                      fontFamily: "Ken",
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Column(
              //   children: [
              //     SliderEditTarget(),
              //   ],
              // ),
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        'Set your weight goal here',
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontFamily: "Ken",
                            fontSize: 11.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Slider(
                      value: _currentSliderValue,
                      min: userD.bmi!.HealthyWeight[0],
                      max: userD.bmi!.HealthyWeight[1],
                      divisions: (userD.bmi!.HealthyWeight[1] -
                              userD.bmi!.HealthyWeight[0])
                          .toInt(),
                      inactiveColor: Colors.grey,
                      activeColor: Color.fromARGB(255, 11, 0, 54),
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                        // print('Last Skor: $value');
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${userD.bmi?.HealthyWeight[0].toStringAsFixed(1)} kg',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 11.5,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 80),
                        Text(
                          '${userD.bmi?.HealthyWeight[1].toStringAsFixed(1)} kg',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 11.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          margin: EdgeInsets.zero,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                try {
                                  DatabaseService(email: user.email)
                                      .updateUserData(
                                          userD.name!,
                                          userD.gender!,
                                          userD.birthdate!,
                                          userD.height!,
                                          userD.weight!,
                                          BMI_Data(userD.height!, userD.weight!,
                                              _currentSliderValue),
                                          userD.img!);
                                    print("Data updated successfully");
                                } catch (e) {
                                  // Handle the exception, e.g., show an error message
                                  print("Error updating user data: $e");
                                }
                                if (!global.globalIsLogin) {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration
                                          .zero, // Mengatur durasi transisi menjadi nol
                                      pageBuilder: (_, __, ___) => HomePage(),
                                    ), // Navigasi ke halaman kedua
                                  );
                                  global.globalIsLogin = true;
                                }
                              },
                              child: Text(
                                'Set',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Ken",
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 11, 0, 54)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.zero,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _currentSliderValue = prev;
                                });
                              },
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Ken",
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 11, 0, 54)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        );
      },
    );
  }
}
