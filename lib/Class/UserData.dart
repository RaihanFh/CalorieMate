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
  late double limitCal;


  UserData({
    this.email,
    this.name,
    this.gender,
    this.birthdate,
    this.height,
    this.weight,
    this.bmi,
    this.img,
  }) {
    calculateLimitCal();
  }

  void calculateLimitCal() {
    if (gender == "Male") {
      limitCal = ((66.5 +
                  (13.75 * weight!) +
                  (5.003 * height!) -
                  (6.75 * UserData.calculateAge(birthdate!))) *
              1.5)
          .roundToDouble();
    } else {
      limitCal = ((655.1 +
                  (9.563 * weight!) +
                  (1.850 * height!) -
                  (4.676 * UserData.calculateAge(birthdate!))) *
              1.5)
          .roundToDouble();
    }
  }

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