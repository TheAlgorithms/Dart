import 'dart:math' show pow;
import 'package:test/test.dart';

// octal number to hex number
Map<String, String> hex_table = {
  '10': 'A',
  '11': 'B',
  '12': 'C',
  '13': 'D',
  '14': 'E',
  '15': 'F',
};
//
// function take octal string value and return hexadecimal string value
String ocatal_to_hex(String octVal) {
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

  // converting to decimal to hex
  if (decVal == 0) {
    return '0';
  }
  String hexString = '';
  while (decVal > 0) {
    String? hexVal = '';
    int remainder = decVal % 16;
    decVal = decVal ~/ 16;
    if (hex_table.containsKey(remainder.toString())) {
      hexVal = hex_table[remainder.toString()];
    } else {
      hexVal = remainder.toString();
    }
    hexString = hexVal! + hexString;
  }

  // returning the value
  if (isNegative) {
    return '-$hexString';
  }
  return hexString;
}

// driver function
void main() {
  // test input
  test('ocatal_to_hex 75', () {
    expect(ocatal_to_hex('75'), equals('3D'));
  });

  test('ocatal_to_hex -62', () {
    expect(ocatal_to_hex('-62'), equals('-32'));
  });

  test('ocatal_to_hex rasies error when number is invalid', () {
    expect(() => ocatal_to_hex('84'), throwsFormatException);
  });

  test('ocatal_to_hex rasies error when number is invalid', () {
    expect(() => ocatal_to_hex('as23'), throwsFormatException);
  });

  test('ocatal_to_hex of empty string raises error', () {
    expect(() => ocatal_to_hex(''), throwsFormatException);
  });
}
