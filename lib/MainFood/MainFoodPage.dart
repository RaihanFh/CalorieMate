import 'package:CalorieMate/Class/CustomIntake.dart';
import 'package:CalorieMate/Class/PresetIntake.dart';
import 'package:CalorieMate/LoadingScreen.dart';
import 'package:CalorieMate/MainFood/AddCustomFood/AddCustomFoodPage.dart';
import 'package:CalorieMate/MainFood/FoodCustomDetailAdd.dart';
import 'package:CalorieMate/MainFood/FoodDetailAdd.dart';
import 'package:CalorieMate/profile/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:CalorieMate/HomePage/HomePage.dart';
import 'package:CalorieMate/services/FoodDatabase.dart';
import 'package:CalorieMate/Class/Consumables.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/UserData.dart';

class MainFoodPage extends StatelessWidget {
  // Tambahkan controller sebagai variabel instance
  final TextEditingController _searchController = TextEditingController();
  final FoodDatabase foodDatabase = FoodDatabase();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount>(context);

    return FutureBuilder(
      future: foodDatabase.getConsumablesList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Menampilkan widget loading jika data belum selesai diambil
          return LoadingScreen();
        } else if (snapshot.hasError) {
          // Menangani error jika terjadi
          return Text('Error: ${snapshot.error}');
        } else {
          // Data sudah berhasil diambil, sekarang bisa membangun tampilan
          List<Consumables> dataList = snapshot.data!;
          return DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // Add a clear button to the search bar
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      color: Color.fromARGB(255, 11, 0, 54),
                      onPressed: () => _searchController.clear(),
                    ),
                    // Add a search icon or button to the search bar
                    // prefixIcon: IconButton(
                    //   icon: Icon(Icons.search),
                    //   color: Color.fromARGB(255, 11, 0, 54),
                    //   onPressed: () {
                    //     // Perform the search here
                    //   },
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Set border color here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Set border color here
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                leadingWidth: 30,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 11, 0, 54),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "FOOD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 11, 0, 54),
                          fontFamily: "Ken",
                          fontSize: 10.5,),
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CUSTOM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 54),
                              fontFamily: "Ken",
                              fontSize: 10.5,),
                          ),
                          // Add custom food button
                          IconButton(
                            icon: Icon(Icons.add_circle_outline, color: Color.fromARGB(255, 11, 0, 54), size: 13,),
                            onPressed: () {
                              
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
                                  pageBuilder: (_, __, ___) => AddCustomFoodPage(),
                                ), // Navigasi ke halaman kedua
                              );
                            },
                          ),
                        ],
                      ),

                    ),
                  ],
                  indicatorColor: Colors.grey,
                ),
              ),
              body: TabBarView(
                children: [
                  // Isi dari masing-masing tab diletakkan di sini
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (Consumables f in dataList)
                            if (f is PresetIntake)
                              FoodDetailAdd(
                                id: f.id!,
                                foodQty: f.weight!,
                                carb: f.carb!,
                                fat: f.fat!,
                                protein: f.protein!,
                                foodCal: f.calorie!,
                                namamakanan: f.name!,
                                weight: f.weight!,
                                img: f.img!,
                              ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (Consumables f in dataList)
                            if (f is CustomIntake && f.user == user.email)
                              FoodCustomDetailAdd(
                                foodQty: f.weight!,
                                carb: f.carb!,
                                fat: f.fat!,
                                protein: f.protein!,
                                foodCal: f.calorie!,
                                namamakanan: f.name!,
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.symmetric(horizontal: 20), // Atur padding sesuai kebutuhan
                height: 60, // Atur tinggi sesuai kebutuhan
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 11, 0, 54), // Atur warna sesuai kebutuhan
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigasi ke halaman pertama
                      },
                      icon: Icon(Icons.featured_play_list_outlined),
                      color: Colors.white, // Atur warna ikon sesuai kebutuhan
                    ),
                    IconButton(
                      onPressed: () {
                        // Navigasi ke halaman kedua (HomePage)
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
                            pageBuilder: (_, __, ___) => HomePage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.home),
                      color: Colors.white70, // Atur warna ikon sesuai kebutuhan
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero, // Mengatur durasi transisi menjadi nol
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
            ),
          );
        }
      }
    );
  }
}

