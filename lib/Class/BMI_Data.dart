import 'dart:math';

class BMI_Data {
  late double BMIScore;
  double UserTarget = 0;
  List<double> HealthyWeight = [];

  BMI_Data(double height, double weight, double target) {
    this.BMIScore = weight /  pow((height*0.01),2);
    this.HealthyWeight.add(pow((height*0.01),2) * 18.5);
    this.HealthyWeight.add(pow((height*0.01),2) * 24.9);
    this.UserTarget = target;
  }
  setTarget(double userTarget){
    this.UserTarget = userTarget;
  }

  Map<String, dynamic> toMap() {
    return {
      'BMIScore': BMIScore,
      'UserTarget': UserTarget,
      'healthyWeight': HealthyWeight,
    };
  }

  static BMI_Data fromMap(Map<String, dynamic> map) {
    BMI_Data bmiData = BMI_Data(0, 0, 0); 
    bmiData.BMIScore = map['BMIScore'];
    bmiData.UserTarget = map['UserTarget'];
    bmiData.HealthyWeight = List<double>.from(map['healthyWeight']);
    return bmiData;
  }
  
  static String getLevel(double score){
    if (score <= 15.9){
      return "Very Severely Underweight";
    }
    else if (score >= 16.0 && score <= 16.9){
      return "Severely Underweight";
    }
    else if (score >= 17.0 && score <= 18.4){
      return "Underweight";
    }
    else if (score >= 18.5 && score <= 24.9){
      return "Normal";
    }
    else if (score >= 25.0 && score <= 29.9){
      return "Overweight";
    }
    else if (score >= 30.0 && score <= 34.9){
      return "Obese Class I";
    }
    else if (score >= 35.0 && score <= 39.9){
      return "Obese Class II";
    }
    else{
      return "Obese Class III";
    }
  }
}
