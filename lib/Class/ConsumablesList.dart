import 'package:CalorieMate/Class/Consumables.dart';

class ConsumablesList {
  List<Consumables> consumablesList = [];

  void addConsumable(Consumables c) {
    consumablesList.add(c);
  }
  
  void removeByName(String s) {
    consumablesList.removeWhere((Consumables c) => c.name == s);
  }

  void resetList() {
    consumablesList.clear();
  }
}
