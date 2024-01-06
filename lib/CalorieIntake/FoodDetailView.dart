import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodDetailView extends StatefulWidget {
  final int foodQty;
  final int carb, fat, protein, foodCal;
  final String namamakanan;

  FoodDetailView({
    required this.foodQty,
    required this.carb,
    required this.fat,
    required this.protein,
    required this.foodCal,
    required this.namamakanan,
  });

  @override
  State<FoodDetailView> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetailView> {
  late int foodQty;
  late int carb, fat, protein, foodCal;
  late String namamakanan;
  bool _isExpanded = false;

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
  }

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm').format(now);

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text(
                          '$formattedTime',
                          style: TextStyle(
                            color: Color.fromARGB(255, 11, 0, 54),
                            fontSize: 15,
                            fontFamily: "Ken",
                            fontWeight: FontWeight.normal,
                          ),
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
    );
  }
}
