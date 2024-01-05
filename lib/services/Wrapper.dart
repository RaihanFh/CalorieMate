import 'package:CalorieMate/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:provider/provider.dart';
import 'package:CalorieMate/regist/registPage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAccount?>(context);
    print(user);

    if (user == null){
      return registPage();
    }
    else{
      return HomePage();
    }
  }
}
