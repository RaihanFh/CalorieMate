import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:flutter_test/flutter_test.dart'; 

void main() {
  test('Set User Target', () {
    BMI_Data bmiData = BMI_Data(170.0, 70.0, 0);
    double userTarget = 60.0;

    bmiData.setTarget(userTarget);
    expect(bmiData.UserTarget, userTarget);
  });
}
