import "dart:math" show pow;

import 'package:test/test.dart';

int binaryToDecimal(String binaryString) {
  binaryString = binaryString.trim();
  if (binaryString == "") {
    throw FormatException("An empty value was passed to the function");
  }
  bool isNegative = binaryString[0] == "-";
  if (isNegative) binaryString = binaryString.substring(1);
  int decimalValue = 0;
  for (int i = 0; i < binaryString.length; i++) {
    if ("01".contains(binaryString[i]) == false) {
      throw FormatException("Non-binary value was passed to the function");
    } else {
      decimalValue += (pow(2, binaryString.length - i - 1).toInt() *
          (int.tryParse(binaryString[i]) ?? 0));
    }
  }
  return isNegative ? -1 * decimalValue : decimalValue;
}

void main() {
  test('test case 1', () {
    expect(binaryToDecimal("-111"), -7);
  });
  test('test case 2', () {
    expect(binaryToDecimal("101011"), 43);
  });

  test('test case 3', () {
    expect(() => binaryToDecimal("1a1"), throwsFormatException);
  });
}
