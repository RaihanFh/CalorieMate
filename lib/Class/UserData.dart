import 'package:CalorieMate/Class/BMI_Data.dart';

class UserAccount {
  
  final String? email;

  UserAccount({ this.email});
}

class UserData {
  final String? email, name;
  final DateTime? birthdate;
  final double? weight, height;
  final String? gender;
  final BMI_Data? bmi;
  final String? img;


  UserData({
     this.email,
     this.name,
     this.gender,
     this.birthdate,
     this.height,
     this.weight,
     this.bmi,
     this.img
  });

  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;

    // Check if the birthday has occurred this year
    if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

      return age;
    }
  }