//Convert a Decimal Number to Any Other Representation
//https://en.wikipedia.org/wiki/Positional_notation#Base_conversion

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

String decimalToAny(int value, int base) {
  var ALPHABET_VALUES = {
    10: 'A',
    11: 'B',
    12: 'C',
    13: 'D',
    14: 'E',
    15: 'F',
    16: 'G',
    17: 'H',
    18: 'I',
    19: 'J',
    20: 'K',
    21: 'L',
    22: 'M',
    23: 'N',
    24: 'O',
    25: 'P',
    26: 'Q',
    27: 'R',
    28: 'S',
    29: 'T',
    30: 'U',
    31: 'V',
    32: 'W',
    33: 'X',
    34: 'Y',
    35: 'Z'
  };

  if (value == 0) return "0";

  if (base < 2 || base > 36) throw FormatException("Base not supported!");

  bool negative = false;
  if (value < 0) {
    negative = true;
    value *= -1;
  }

  String output = "";
  while (value > 0) {
    int remainder = value % base;
    value = value ~/ base;
    output = (remainder < 10
            ? remainder.toString()
            : ALPHABET_VALUES[remainder] ?? '0') +
        output;
  }

  return negative ? '-' + output : output;
}

void main() {
  test('test case 1', () => expect(decimalToAny(0, 2), '0'));
  test('test case 2', () => expect(decimalToAny(5, 4), '11'));
  test('test case 3', () => expect(decimalToAny(20, 3), '202'));
  test('test case 4', () => expect(decimalToAny(-58, 16), '-3A'));
  test('test case 5', () => expect(decimalToAny(243, 17), 'E5'));
  test('test case 6', () => expect(decimalToAny(34923, 36), 'QY3'));
  test('test case 7', () => expect(decimalToAny(10, 11), 'A'));
  test('test case 8', () => expect(decimalToAny(-16, 16), '-10'));
  test('test case 9', () => expect(decimalToAny(36, 36), '10'));
}
