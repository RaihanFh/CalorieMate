import 'package:flutter/material.dart';

class FoodCustomDetailAdd extends StatefulWidget {
  final int foodQty;
  final int carb, fat, protein, foodCal;
  final String namamakanan;

  FoodCustomDetailAdd({
    required this.foodQty,
    required this.carb,
    required this.fat,
    required this.protein,
    required this.foodCal,
    required this.namamakanan,
  });

  @override
  State<FoodCustomDetailAdd> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodCustomDetailAdd> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(100, 100, 0, 0), // Sesuaikan dengan posisi yang diinginkan
          items: [
            PopupMenuItem(
              child: ListTile(
                title: Text('Edit'),
                onTap: () {
                  print('edit');
                },
              ),
            ),
            PopupMenuItem(
              child: ListTile(
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
                              // Logic to delete the item goes here
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
                              // Logic to delete the item goes here
                              // This is where you'd delete the item from your data structure
                              Navigator.of(context).pop(); // Close the dialog
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
                            onPressed: () {
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
}
