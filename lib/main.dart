// import 'package:CalorieMate/Login/LoginPage.dart';
// import 'package:CalorieMate/MainFood/MainFoodPage.dart';
import 'package:flutter/material.dart';
// import 'package:CalorieMate/regist/registPage.dart';
// import 'package:CalorieMate/registForm/regisFormPage.dart';
// import 'package:CalorieMate/editProfleForm/editProfileFormPage.dart';
// import 'package:CalorieMate/HomePage/HomePage.dart';
// import 'package:CalorieMate/profile/ProfilePage.dart';
// import 'package:CalorieMate/CalorieIntake/CalorieIntakePage.dart';
// import 'package:CalorieMate/FoodRecomend/FoodRekomendPage.dart';
// import 'package:CalorieMate/BMIDetails/BMIDetailsPage.dart';
// import 'package:CalorieMate/FoodDetail/FoodDetailPage.dart';
import 'package:CalorieMate/services/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/services/auth.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return StreamProvider<UserAccount?>(
      create: (context) => AuthService().user,
      initialData: null, 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

