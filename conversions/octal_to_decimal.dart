import 'dart:math' show pow;
import 'package:test/test.dart';

// octal number to decimal number conversion
//
// function to take oct string value and  return decmal string value
String ocatal_to_decimal(String octVal) {
  // checking for unexpected values
  octVal = octVal.trim();
  if (octVal == '') {
    throw FormatException('An empty value was passed to the function');
  }

  // negative number check
  bool isNegative = octVal[0] == '-';
  if (isNegative) octVal = octVal.substring(1);

  int oct;
  try {
    oct = int.parse(octVal);
  } catch (e) {
    throw FormatException('An invalid value was passed to the function');
  }

  // checking number not valid for octal is passed(0-7)
  for (int i = 0; i < octVal.length; i++) {
    if (!(int.parse(octVal.substring(i, i + 1)) < 8)) {
      throw FormatException('An invalid value was passed to the function');
    }
  }

  // converting octal to decimal
  int decVal = 0, i = 0;
  while (oct != 0) {
    decVal = decVal + ((oct % 10) * (pow(8, i) as int));
    i++;
    oct = oct ~/ 10;
  }

  // returning the value
  if (isNegative) {
    return '-$decVal';
  }
  return decVal.toString();
}

// driver function
void main() {
  // test cases for different input
  test('ocatal_to_decimal 75', () {
    expect(ocatal_to_decimal('75'), equals('61'));
  });

  test('ocatal_to_decimal -62', () {
    expect(ocatal_to_decimal('-62'), equals('-50'));
  });

  test('ocatal_to_decimal rasies error when number is invalid', () {
    expect(() => ocatal_to_decimal('84'), throwsFormatException);
  });

  test('ocatal_to_decimal rasies error when number is invalid', () {
    expect(() => ocatal_to_decimal('as23'), throwsFormatException);
  });

  test('ocatal_to_decimal of empty string raises error', () {
    expect(() => ocatal_to_decimal(''), throwsFormatException);
  });
}
