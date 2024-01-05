import 'package:CalorieMate/Class/Consumables.dart';

class CustomIntake extends Consumables {
  String id = ''; String user = '';

  CustomIntake (String id,String user, String name, int calorie, int fat, int protein, int carb, int weight) :
        super(name: name, calorie: calorie, fat: fat, protein: protein, carb: carb, weight: weight) {
    this.id = id;
    this.user = user;
  }

  Map<String, dynamic> toMapC() {
    return {
      'user' : user,
      'id': id,
      'name': name,
      'calorie': calorie,
      'fat': fat,
      'protein': protein,
      'carb': carb,
      'weight': weight,
      'img': '',
    };
  }

  static CustomIntake fromMapC(Map<String, dynamic> map){
    CustomIntake cI = CustomIntake(map['id'], map['user'], map['name'],  map['calorie'], map['fat'], map['protein'], map['carb'], map['weight']);
    return cI;
  }
}