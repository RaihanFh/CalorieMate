import 'package:CalorieMate/Class/Consumables.dart';
// import 'package:CalorieMate/Class/UserData.dart';

class DailyIntake {
  List<Consumables> CL = [];
  late DateTime date; // = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int totCal = 0;
  String? user; 

  DailyIntake(String user_, List<Consumables> CL_, DateTime date_){
    this.user = user_;
    this.date = date_;
    this.CL = CL_;
    setCal(CL);
  }
  
  addF(Consumables c){
    CL.add(c);
    totCal += c.calorie!;
  }
  
  removeByNameF(String s){
    CL.removeWhere((Consumables c) => c.name == s);
  }

  resetF(){
    CL.clear();
  }

  setCal(List<Consumables> CL){
    for(Consumables c in CL){
      this.totCal += c.calorie!;
    }
  }
}