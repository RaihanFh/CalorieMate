import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Convert to Map and From Map', () {
    double height = 170.0;
    double weight = 70.0;
    double target = 0;

    BMI_Data bmiData = BMI_Data(height, weight, target);
    Map<String, dynamic> bmiMap = bmiData.toMap();

    BMI_Data fromMapBmiData = BMI_Data.fromMap(bmiMap);
    expect(fromMapBmiData.BMIScore, bmiData.BMIScore);
    expect(fromMapBmiData.UserTarget, bmiData.UserTarget);
    expect(fromMapBmiData.HealthyWeight, bmiData.HealthyWeight);
  });
}
