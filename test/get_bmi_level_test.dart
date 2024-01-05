import 'package:CalorieMate/Class/BMI_Data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get BMI Level', () {
    expect(BMI_Data.getLevel(17.0), 'Underweight');
    expect(BMI_Data.getLevel(25.0), 'Overweight');
    expect(BMI_Data.getLevel(35.0), 'Obese Class II');
    // Tambahkan lebih banyak pengujian sesuai kebutuhan
  });
}
