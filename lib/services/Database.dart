import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CalorieMate/Class/UserData.dart';
import 'package:CalorieMate/Class/BMI_Data.dart';

class DatabaseService {
  final String? email;
  DatabaseService({this.email});
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('userData');

  Future<void> updateUserData(String name, String gender, DateTime birthdate, double height, double weight, BMI_Data bmi, String img) async {
    DocumentReference docRef = userCollection.doc(email);

    // Periksa apakah dokumen dengan email yang diberikan sudah ada
    bool docExists = (await docRef.get()).exists;

    if (docExists) {
      // Jika dokumen sudah ada, gunakan update untuk memperbarui nilai-nilai yang ada
      return await docRef.update({
        'email': email,
        'name': name,
        'gender': gender,
        'birthdate': birthdate,
        'weight': weight,
        'height': height,
        'BMI data': bmi.toMap(),
        'img' : img
      });
    } else {
      // Jika dokumen belum ada, gunakan set untuk membuat dokumen baru
      return await docRef.set({
        'email': email,
        'name': name,
        'gender': gender,
        'birthdate': birthdate,
        'weight': weight,
        'height': height,
        'BMI data': BMI_Data(height, weight, 0).toMap(),
        'img' : img
      });
    }
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
        email: email,
        name: data['name'],
        birthdate: data['birthdate'].toDate(),
        gender: data['gender'],
        height: data['height'],
        weight: data['weight'],
        bmi: BMI_Data.fromMap(data['BMI data']),
        img: data['img']
      );
  }


  Stream<UserData> get uData {
    return userCollection.doc(email).snapshots().map(_userDataFromSnapshot);
  }
}
