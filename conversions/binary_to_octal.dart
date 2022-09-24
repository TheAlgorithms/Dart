import 'package:test/test.dart';

//Binary number to octal number conversion
void main() {
  test('binary_to_octal -1111', () {
    expect(binary_to_octal('-1111'), equals('-17'));
  });

  test('binary_to_octal 101011', () {
    expect(binary_to_octal('101011'), equals('53'));
  });

  test('binary_to_octal rasies error when number is invalid', () {
    expect(() => binary_to_octal('-1011a01'), throwsFormatException);
  });

  test('binary_to_octal of empty string raises error', () {
    expect(() => binary_to_octal(''), throwsFormatException);
  });
}

String binary_to_octal(String binString) {
  binString = binString.trim();
  if (binString == '') {
    throw FormatException('An empty value was passed to the function');
  }
  bool isNegative = binString[0] == '-';
  if (isNegative) binString = binString.substring(1);

  String octalVal = '';
  int binary;
  try {
    binary = int.parse(binString);
  } catch (e) {
    throw FormatException('An invalid value was passed to the function');
  }
  int currBit;
  int j = 1;
  while (binary > 0) {
    int code_3 = 0;
    for (int i = 0; i < 3; i++) {
      currBit = binary % 10;
      binary = binary ~/ 10;
      code_3 += currBit * j;
      j *= 2;
    }
    octalVal = code_3.toString() + octalVal;
    j = 1;
  }
  if (isNegative) {
    return '-$octalVal';
  }
  return octalVal;
}
