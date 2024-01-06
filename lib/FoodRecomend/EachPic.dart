import 'package:CalorieMate/Class/Consumables.dart';
import 'package:CalorieMate/Class/DailyIntake.dart';
import 'package:CalorieMate/Class/PresetIntake.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/HomePage/HomePage.dart';
import 'package:CalorieMate/LoadingScreen.dart';
import 'package:CalorieMate/services/FoodDatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EachPic extends StatelessWidget{
  final String imagePath, id;
  final String foodName;
  final int foodQty, weight;
  final int carb;
  final int fat;
  final int protein;
  final int calorie;
  final FoodDatabase foodDatabase = FoodDatabase();

  EachPic({
    required this.imagePath,
    required this.foodName,
    required this.foodQty,
    required this.carb,
    required this.fat,
    required this.protein,
    required this.calorie,
    required this.id,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);
    DailyIntake? dI;

    return FutureBuilder(
      future: foodDatabase.getDailyIntake(user.email!),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading widget if data is still being fetched
          return LoadingScreen();
        }
        if (snapshot.hasError) {
          // Handle errors here
          return Text('Error: ${snapshot.error}');
        }

        if(snapshot.hasData){
          dI = snapshot.data;
        }
        else{
          List<Consumables> CL = [];
          dI = DailyIntake(user.email!, CL, DateTime.now());
        }
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(foodName),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildInfo('Food Quantity', foodQty.toString()),
                    _buildInfo('Carb', carb.toString()),
                    _buildInfo('Fat', fat.toString()),
                    _buildInfo('Protein', protein.toString()),
                    _buildInfo('Calorie', calorie.toString()),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Tutup'),
                  ),
                  TextButton(
                    onPressed: () async{
                      PresetIntake pI = PresetIntake(id, foodName, calorie, fat, protein, carb, weight, imagePath);
                      dI!.addF(pI);
                      try{
                        await FoodDatabase().uploadIntake(dI!);
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration
                                .zero, 
                            pageBuilder: (_, __, ___) => HomePage(),
                          ), 
                        );
                      } catch (e){
                        print("Error adding intake: e");
                      }
                    },
                    child: Text('Add To Your Intake'),
                  ),
                ],
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2, color: Colors.grey),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(imagePath),
                    width: 105,
                    height: 105,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.5,
                              child: Container(
                                width: 105,
                                height: 15,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              foodName,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ]
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$label: $value',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}