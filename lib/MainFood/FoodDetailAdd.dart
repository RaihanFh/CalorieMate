import 'package:CalorieMate/Class/PresetIntake.dart';
import 'package:CalorieMate/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/services/FoodDatabase.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/Class/DailyIntake.dart';
import 'package:CalorieMate/Class/Consumables.dart';

class FoodDetailAdd extends StatefulWidget {
  final int foodQty, weight;
  final int carb, fat, protein, foodCal;
  final String namamakanan, id, img;

  FoodDetailAdd({
    required this.id,
    required this.foodQty,
    required this.carb,
    required this.fat,
    required this.protein,
    required this.foodCal,
    required this.namamakanan,
    required this.weight,
    required this.img
  });

  @override
  State<FoodDetailAdd> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetailAdd> {
  late int foodQty, weight;
  late int carb, fat, protein, foodCal;
  late String namamakanan, id, img;
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
    img = widget.img;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);
    DailyIntake? dI;

    return FutureBuilder(
      future: foodDatabase.getDailyIntake(user.email!),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Menampilkan widget loading jika data belum selesai diambil
          return LoadingScreen();
        } else if (snapshot.hasError) {
          // Menangani error jika terjadi
          return Text('Error: ${snapshot.error}');
        } else {
          if(snapshot.hasData){
            dI = snapshot.data;
            print("Ngambil lama");
          }
          else{
            List<Consumables> CL = [];
            dI = DailyIntake(user.email!, CL, DateTime.now());
            print("Ngambil baru");
          }
          return Padding(
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
                                "$namamakanan (${foodQty} g)",
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
                                  PresetIntake pI = PresetIntake(id, namamakanan, foodCal, fat, protein, carb, weight, img);
                                  dI!.addF(pI);
                                  print("Ini dI yang di add: ${dI!.CL[0].name}");
                                  try{
                                    await FoodDatabase().uploadIntake(dI!);

                                  } catch (e){
                                    print("Error adding intake: e");
                                  }
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
                            Column(
                              children: [
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
                                SizedBox(height: 15,),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     TextButton(
                                //       onPressed: () {
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute(builder: (context) => FoodDetailPage()),
                                //         );
                                //       },
                                //       child: Text(
                                //         'Ingredients',
                                //         style: TextStyle(
                                //           color: Color.fromARGB(255, 11, 0, 54),
                                //           fontWeight: FontWeight.normal,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      isExpanded: _isExpanded,
                    ),
                  ],
                ),
              ],
            ),
          );


        }
      }
    );
  }
}
