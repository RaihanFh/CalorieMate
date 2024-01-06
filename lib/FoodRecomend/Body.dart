import 'package:CalorieMate/Class/Consumables.dart';
import 'package:CalorieMate/Class/DailyIntake.dart';
import 'package:CalorieMate/Class/PresetIntake.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/FoodRecomend/EachPic.dart';
import 'package:CalorieMate/LoadingScreen.dart';
import 'package:CalorieMate/services/Database.dart';
import 'package:CalorieMate/services/FoodDatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bodyy extends StatefulWidget {
  @override
  State<Bodyy> createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);
    final FoodDatabase foodDatabase = FoodDatabase();
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
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: dataList.where((f) =>
                        (f is PresetIntake) &&(f.calorie! <= (userD.limitCal - dailyIntake!.totCal))).length,
                        itemBuilder: (BuildContext context, int index) {
                          Consumables f = dataList.where((f) =>
                          (f is PresetIntake) && (f.calorie! <= (userD.limitCal - dailyIntake!.totCal))).elementAt(index);
                          return EachPic(
                            calorie: f.calorie!,
                            carb: f.carb!,
                            fat: f.fat!,
                            foodName: f.name!,
                            foodQty: f.weight!,
                            imagePath: f.img!,
                            protein: f.protein!,
                            id: (f as PresetIntake).id!,
                            weight: f.weight!,
                          );
                        },
                      );
                    }
                );
              }
          );
        }
    );
  }
}
