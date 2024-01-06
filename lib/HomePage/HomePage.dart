import 'package:CalorieMate/CalorieIntake/CalorieIntakePage.dart';
import 'package:CalorieMate/Class/Consumables.dart';
import 'package:CalorieMate/Class/DailyIntake.dart';
import 'package:CalorieMate/Class/PresetIntake.dart';
import 'package:CalorieMate/FoodRecomend/EachPic.dart';
import 'package:CalorieMate/FoodRecomend/FoodRekomendPage.dart';
import 'package:CalorieMate/LoadingScreen.dart';
import 'package:CalorieMate/MainFood/MainFoodPage.dart';
import 'package:CalorieMate/profile/ProfilePage.dart';
import 'package:CalorieMate/BMIDetails/BMIDetailsPage.dart';
import 'package:CalorieMate/services/FoodDatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/services/Database.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatelessWidget {
  final FoodDatabase foodDatabase = FoodDatabase();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserAccount>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(email: user.email).uData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading widget if data is still being fetched
          return LoadingScreen();
        }
        if (snapshot.hasError) {
          // Handle errors here
          return Text('Error: ${snapshot.error}');
        }
        UserData userD = snapshot.data!;
        double skorBMI = userD.bmi!.BMIScore;
        double currWeight = userD.weight!.roundToDouble();
        double targetWeight = userD.bmi!.UserTarget.roundToDouble();
        double calLimit = userD.limitCal;

        return FutureBuilder(
          future: foodDatabase.getDailyIntake(userD.email!),
          builder: (context, snapshotDI){
            if (snapshotDI.connectionState == ConnectionState.waiting) {
              // Return a loading widget if data is still being fetched
              return LoadingScreen();
            }
            if (snapshotDI.hasError) {
              // Handle errors here
              return Text('Error: ${snapshotDI.error}');
            }

            DailyIntake? dailyIntake;
            if(snapshotDI.hasData){
              dailyIntake = snapshotDI.data;
            }
            else{
              List<Consumables> CL = [];
              dailyIntake = DailyIntake(user.email!, CL, DateTime.now());
            }
            int cal = dailyIntake!.totCal;

            return FutureBuilder(
              future: foodDatabase.getConsumablesList(),
              builder: (context, snapshotCL) {
                if (snapshotCL.connectionState == ConnectionState.waiting) {
                  // Return a loading widget if data is still being fetched
                  return LoadingScreen();
                }
                if (snapshotCL.hasError) {
                  // Handle errors here
                  return Text('Error: ${snapshotCL.error}');
                }
                List<Consumables> dataList = snapshotCL.data!;
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    width: width,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        Text(
                          "CALORIE MATE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            fontFamily: "Ken",
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "INFORMATION",
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 0, 54),
                                fontSize: 15,
                                fontFamily: "Ken",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "BMI STATUS",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 11, 0, 54),
                                    fontSize: 15,
                                    fontFamily: "Ken",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 300,
                                child: SfLinearGauge(
                                  showLabels: false,
                                  showTicks: false,
                                  showAxisTrack: false,
                                  minimum: 17,
                                  maximum: 34.9,
                                  orientation: LinearGaugeOrientation.horizontal,
                                  ranges: [
                                    LinearGaugeRange(
                                      startValue: 17.0,
                                      endValue: 18.4,
                                      color: Color.fromARGB(255, 11, 0, 54),
                                    ),
                                    LinearGaugeRange(
                                      startValue: 18.5,
                                      endValue: 24.9,
                                      color: Color.fromARGB(255, 11, 0, 54),
                                    ),
                                    LinearGaugeRange(
                                      startValue: 25.0,
                                      endValue: 29.9,
                                      color: Color.fromARGB(255, 11, 0, 54),
                                    ),
                                    LinearGaugeRange(
                                      startValue: 30.0,
                                      endValue: 34.9,
                                      color: Color.fromARGB(255, 11, 0, 54),
                                    ),
                                  ],
                                  markerPointers: <LinearShapePointer>[
                                    LinearShapePointer(
                                      value: skorBMI, //POINTER BMI STATUS
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Under",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 27),
                                  Text(
                                    "Normal",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 35),
                                  Text(
                                    "Over",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 40),
                                  Text(
                                    "Obese",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "DAILY CALORIE LIMIT",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 11, 0, 54),
                                    fontSize: 15,
                                    fontFamily: "Ken",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: cal > calLimit ? 1.0 : cal / calLimit,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 11, 0, 54)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 13),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '$cal Cal', //CURRCALL USER
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Goal: $calLimit Cal', //GOAL CAL USER
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration: Duration
                                            .zero, // Mengatur durasi transisi menjadi nol
                                        pageBuilder: (_, __, ___) => IntakePage(),
                                      ), // Navigasi ke halaman kedua
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "TARGET WEIGHT",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 11, 0, 54),
                                    fontSize: 15,
                                    fontFamily: "Ken",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: currWeight > targetWeight
                                          ? targetWeight / currWeight
                                          : currWeight / targetWeight,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 11, 0, 54)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 13),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '$currWeight Kg',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Goal: $targetWeight Kg',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 0, 54),
                                      fontFamily: "Ken",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration: Duration
                                            .zero, // Mengatur durasi transisi menjadi nol
                                        pageBuilder: (_, __, ___) => BMIDetailPage(),
                                      ), // Navigasi ke halaman kedua
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "FOOD RECOMENDATION",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 11, 0, 54),
                                    fontSize: 15,
                                    fontFamily: "Ken",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration: Duration
                                            .zero, // Mengatur durasi transisi menjadi nol
                                        pageBuilder: (_, __, ___) => FoodRekomendPage(),
                                      ), // Navigasi ke halaman kedua
                                    );
                                  },
                                  child: Text(
                                    " (show all)",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Ken",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding:
                              EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  for (Consumables f in dataList
                                      .where((f) => (f is PresetIntake) && (f.calorie! <= (calLimit - cal)))
                                      .take(3)) // Limit the number of elements to 3
                                    EachPic(
                                      calorie: f.calorie!,
                                      carb: f.carb!,
                                      fat: f.fat!,
                                      foodName: f.name!,
                                      foodQty: f.weight!,
                                      imagePath: f.img!,
                                      protein: f.protein!,
                                      id: (f as PresetIntake).id!,
                                      weight: f.weight!,
                                    ),
                                ],
                              ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20), // Atur padding sesuai kebutuhan
                    height: 60, // Atur tinggi sesuai kebutuhan
                    decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 11, 0, 54), // Atur warna sesuai kebutuhan
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration
                                    .zero, // Mengatur durasi transisi menjadi nol
                                pageBuilder: (_, __, ___) => MainFoodPage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.featured_play_list_outlined),
                          color: Colors.white70, // Atur warna ikon sesuai kebutuhan
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.home),
                          color: Colors.white, // Atur warna ikon sesuai kebutuhan
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration
                                    .zero, // Mengatur durasi transisi menjadi nol
                                pageBuilder: (_, __, ___) => ProfilePage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.account_circle_outlined),
                          color: Colors.white70, // Atur warna ikon sesuai kebutuhan
                        ),
                      ],
                    ),
                  ),
                );
              }
            );
          }
        );
      },
    );
  }
}
