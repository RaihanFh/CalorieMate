import 'package:CalorieMate/Class/CustomIntake.dart';
import 'package:CalorieMate/Class/PresetIntake.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CalorieMate/Class/Consumables.dart';
import 'package:CalorieMate/Class/DailyIntake.dart';

class FoodDatabase {
  final CollectionReference consumablesCollection = FirebaseFirestore.instance.collection('foodData');
  final CollectionReference intakeCollection = FirebaseFirestore.instance.collection('IntakeData');

  List<Consumables> _consumablesDataFromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data['user'] == '') {
        return PresetIntake(
          doc.id, 
          data['name'],
          data['cal'],
          data['fat'],
          data['prot'],
          data['carb'],
          data['weight'],
          data['pic'],
        );
      }
      else{
        return CustomIntake(
          doc.id,
          data['user'],
          data['name'],
          data['cal'],
          data['fat'],
          data['prot'],
          data['carb'],
          data['weight'],
        );
      }
    }).toList();
  }

  Future<List<Consumables>> getConsumablesList() async {
    try {
      // Mendapatkan data dari Firebase
      QuerySnapshot querySnapshot = await consumablesCollection.get();

      // Mengembalikan List<PresetIntake> dari data Firebase
      return _consumablesDataFromQuerySnapshot(querySnapshot);
    } catch (e) {
      // Handle error jika terjadi
      print("Error getting consumables: $e");
      // Mengembalikan List kosong jika terjadi error
      return [];
    }
  }
  
  Future uploadConsumables(String user, String name, int calorie, int fat, int protein, int carb, int weight) async {
    return await consumablesCollection.add({
      'user': user,
      'name': name,
      'cal': calorie,
      'carb' : carb,
      'fat': fat,
      'weight': weight,
      'prot': protein,
      'pic' : ''
    });
  }

  Future<void> deleteConsumables(String id) async {
    await consumablesCollection.doc(id).delete();
  }

  Future uploadIntake(DailyIntake dailyIntake) async {
    DocumentReference docRef = intakeCollection.doc('${dailyIntake.user}-${dailyIntake.date.day}${dailyIntake.date.month}${dailyIntake.date.year}');

    List<Map<String, dynamic>> L = [];
    for(Consumables c in dailyIntake.CL){
      if(c is PresetIntake){
        L.add(c.toMapP());
      }
      else if(c is CustomIntake){
        L.add(c.toMapC());
      }
    }

    bool docExists = (await docRef.get()).exists;
    if (docExists) {
      // Jika dokumen sudah ada, gunakan update untuk memperbarui nilai-nilai yang ada
      return await docRef.update({
        'user' : dailyIntake.user,
        'date' : dailyIntake.date,
        'Intake_List' : L
      });
    } else {
      // Jika dokumen belum ada, gunakan set untuk membuat dokumen baru
      return await docRef.set({
        'user' : dailyIntake.user,
        'date' : dailyIntake.date,
        'Intake_List' : L
      });
    }
  }

  Future<DailyIntake?> getDailyIntake(String user) async {
    try {
      // Mendapatkan data dari Firebase berdasarkan id
      final date = DateTime.now();
      DocumentSnapshot docSnapshot = await intakeCollection.doc("${user}-${date.day}${date.month}${date.year}").get();
  
      // Memeriksa apakah dokumen ada atau tidak
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        List<Consumables> intakeList = [];
        for(Map<String, dynamic> d in data['Intake_List']){
          if (data['user'] == '') {
            intakeList.add(PresetIntake(
              d["id"], 
              d["name"],
              d["calorie"],
              d["fat"],
              d["protein"],
              d["carb"],
              d["weight"],
              d["img"],
            ));
          }
          else{
              intakeList.add(CustomIntake(
              d['id'],
              d['user'],
              d['name'],
              d['calorie'],
              d['fat'],
              d['protein'],
              d['carb'],
              d['weight'],
            ));
          }
        }
        // Mengembalikan objek DailyIntake  
        return DailyIntake(
          data['user'],
          intakeList,
          data['date'].toDate(),
        );
      } else {
        // Jika dokumen tidak ditemukan, kembalikan null atau sesuai kebutuhan
        return null;
      }
    } catch (e) {
      // Handle error jika terjadi
      print("Error getting daily intake: $e");
      // Mengembalikan null jika terjadi error
      return null;
    }
  }
}
