import 'package:CalorieMate/FoodDetail/FoodDetailPage.dart';
import 'package:flutter/material.dart';

/*
pemanggilan 
EachPic(
  imagePath: 'assets/img/Pizza.jpg',
  foodName: 'Nama Makanan',
  foodQty: '10',
  carb: '20',
  fat: '15',
  protein: '30',
  calorie: '250',
)
*/

class EachPic extends StatelessWidget{
  final String imagePath;
  final String foodName;
  final int foodQty;
  final int carb;
  final int fat;
  final int protein;
  final int calorie;

  EachPic({
    required this.imagePath,
    required this.foodName,
    required this.foodQty,
    required this.carb,
    required this.fat,
    required this.protein,
    required this.calorie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
        //     pageBuilder: (_, __, ___) => FoodDetailPage(),
        //   ),
        // );
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
                onPressed: () {
                  Navigator.pop(context);
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