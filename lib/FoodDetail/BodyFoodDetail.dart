import 'package:flutter/material.dart';

class BodyFoodDetail extends StatefulWidget {
  @override
  State<BodyFoodDetail> createState() => _BodyyState();
}

class _BodyyState extends State<BodyFoodDetail> {
  List<String> ingredients = [
    '350 g potatoes, steamed, peeled, cut into strips',
    '350 g white tofu',
    '350 g temperature',
    '7 green lettuce leaves, torn into strips',
    '2 cucumbers, thinly sliced',
    '100 gauge, boiled',
    '200 g cabbage, roughly sliced, boiled',
    'Cooking oil, for sautéing and frying',
    '3 cloves garlic, finely chopped',
    '1 tsp ground coriander',
    '1 tsp salt',
    '200ml water',
    'Peanut sauce',
    '6 hard-boiled eggs, peeled, cut into slices',
    '2 tomatoes, cut into slices',
    '3 tbsp fried shallots',
    'Crackers and chips',
  ];

  List<String> NVI = [
    'Energy: 1305 kj',
    'Fat: 18.14 gr',
    'Protein: 18.46 gr',
    'Carbohydrates: 26,59 gr',
    'Sodium: 115 mg',
    'Potassium: 570 mg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: AssetImage('assets/img/Pizza.jpg'),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "INGREDIENTS",
                style: TextStyle(
                  color: Color.fromARGB(255, 11, 0, 54),
                  fontSize: 15,
                  fontFamily: "Ken",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ListTile(
                  title: Text(
                    ingredients[index],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "NUTRITIONAL VALUE INFORMATION",
                style: TextStyle(
                  color: Color.fromARGB(255, 11, 0, 54),
                  fontSize: 15,
                  fontFamily: "Ken",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: NVI.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ListTile(
                  title: Text(
                    NVI[index],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
