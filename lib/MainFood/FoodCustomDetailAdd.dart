import 'package:CalorieMate/Class/Consumables.dart';
import 'package:CalorieMate/Class/CustomIntake.dart';
import 'package:CalorieMate/Class/DailyIntake.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/HomePage/HomePage.dart';
import 'package:CalorieMate/services/FoodDatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodCustomDetailAdd extends StatefulWidget {
  final int foodQty, weight;
  final int carb, fat, protein, foodCal;
  final String namamakanan, id;

  FoodCustomDetailAdd({
    required this.id,
    required this.foodQty,
    required this.carb,
    required this.fat,
    required this.protein,
    required this.foodCal,
    required this.namamakanan,
    required this.weight,
  });

  @override
  State<FoodCustomDetailAdd> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodCustomDetailAdd> {
  late int foodQty, weight;
  late int carb, fat, protein, foodCal;
  late String namamakanan, id;
  bool _isExpanded = false;
  final FoodDatabase foodDatabase = FoodDatabase();


  @override
  void initState() {
    super.initState();
    // Assigning values from widget parameters to local variables
    foodQty = widget.foodQty;
    carb = widget.carb;
    fat = widget.fat;
    protein = widget.protein;
    foodCal = widget.foodCal;
    namamakanan = widget.namamakanan;
    id = widget.id;
    weight = widget.weight;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);
    DailyIntake? dI;

    return FutureBuilder(
      future: foodDatabase.getDailyIntake(user.email!),
      builder: (context, snapshot){
        if(snapshot.hasData){
          dI = snapshot.data;
        }
        else{
          List<Consumables> CL = [];
          dI = DailyIntake(user.email!, CL, DateTime.now());
        }
        return GestureDetector(
          onLongPress: () {
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(100, 100, 0, 0), // Sesuaikan dengan posisi yang diinginkan
              items: [
                PopupMenuItem(
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 3), //INI RAI SETTING UKURANNYA
                    title: Text('Remove'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmation'),
                            content: Text('Are you sure you want to remove this item?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 11, 0, 54),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                  foodDatabase.deleteConsumables(id);
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration.zero,
                                      pageBuilder: (_, __, ___) => HomePage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Remove',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  
                ),
              ],
              elevation: 8.0,
            );
          },
          child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _isExpanded = isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Row(
                            children: [
                              Text(
                                "$namamakanan ($foodQty g)",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 11, 0, 54),
                                  fontSize: 15,
                                  fontFamily: "Ken",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline, color: Colors.grey.shade500),
                                onPressed: () async {
                                  CustomIntake cI = CustomIntake(id, user.email!, namamakanan, foodCal, fat, protein, carb, weight);
                                  dI!.addF(cI);
                                  try {
                                    await FoodDatabase().uploadIntake(dI!);
                                  } catch (e) {
                                    print("Error adding intake: $e");
                                  }
                                  // Move the navigation outside the try block
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration.zero,
                                      pageBuilder: (_, __, ___) => HomePage(),
                                    ),
                                  );
                                  print('add');
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Carb",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "$carb g",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Fat",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "$fat g",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Protein",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "$protein g",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Cal",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "$foodCal g",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 11, 0, 54),
                                          fontFamily: "Ken",
                                          fontSize: 11,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      isExpanded: _isExpanded,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
