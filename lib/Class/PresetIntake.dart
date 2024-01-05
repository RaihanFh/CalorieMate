import 'package:CalorieMate/Class/Consumables.dart';

class PresetIntake extends Consumables {
  String? id;

  PresetIntake(String id, String name, int calorie, int fat, int protein, int carb, int weight, String img) :
        super(name: name, calorie: calorie, fat: fat, protein: protein, carb: carb, weight: weight, img: img) {
    this.id = id;
  }

  Map<String, dynamic> toMapP() {
    return {
      'user' : '',
      'id': id,
      'name': name,
      'calorie': calorie,
      'fat': fat,
      'protein': protein,
      'carb': carb,
      'weight': weight,
      'img': img,
    };
  }

  static PresetIntake fromMapP(Map<String, dynamic> map){
    PresetIntake pI = PresetIntake(map['id'], map['name'], map['calorie'], map['fat'], map['protein'], map['carb'], map['weight'], map['img']);
    return pI;
  }
}