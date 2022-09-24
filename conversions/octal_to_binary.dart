import 'dart:math' show pow;
import 'package:test/test.dart';

// octal number to binary number conversion
String ocatal_to_binary(String octVal) {
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
  int decVal = 0, i = 0, binVal = 0;
  while (oct != 0) {
    decVal = decVal + ((oct % 10) * (pow(8, i) as int));
    i++;
    oct = oct ~/ 10;
  }

  // converting to decimal to binary
  i = 1;
  while (decVal != 0) {
    binVal = binVal + (decVal % 2) * i;
    decVal = decVal ~/ 2;
    i = i * 10;
  }

  // returning the value
  if (isNegative) {
    return '-$binVal';
  }
  return binVal.toString();
}

void main() {
  test('ocatal_to_binary 75', () {
    expect(ocatal_to_binary('75'), equals('111101'));
  });

  test('ocatal_to_binary -62', () {
    expect(ocatal_to_binary('-62'), equals('-110010'));
  });

  test('ocatal_to_binary rasies error when number is invalid', () {
    expect(() => ocatal_to_binary('84'), throwsFormatException);
  });

  test('ocatal_to_binary rasies error when number is invalid', () {
    expect(() => ocatal_to_binary('as23'), throwsFormatException);
  });

  test('ocatal_to_binary of empty string raises error', () {
    expect(() => ocatal_to_binary(''), throwsFormatException);
  });
}
