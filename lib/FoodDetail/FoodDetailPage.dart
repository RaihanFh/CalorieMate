import 'package:flutter/material.dart';
import 'BodyFoodDetail.dart';

class FoodDetailPage extends StatefulWidget {
  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  String namamakanan = 'haha';
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // Ubah tinggi AppBar di sini
        child: AppBar(
          title: Row(
            children: [
              Text(
                "$namamakanan",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 0, 54),
                    fontFamily: "Ken",
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Color.fromARGB(255, 11, 0, 54)),
                onPressed: () {
                  print('add');
                },
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 11, 0, 54)),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            //SizedBox(height: 20),
            //HeaderFoodDetail(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: BodyFoodDetail(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
