import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Calculate BMI Score', () {
    double height = 170.0;
    double weight = 70.0;
    double expectedResult = 24.22;

    BMI_Data bmiData = BMI_Data(height, weight, 0);
    expect(bmiData.BMIScore, closeTo(expectedResult, 0.01));
  });
}
