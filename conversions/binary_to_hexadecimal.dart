import 'package:test/test.dart';

//Binary number to hexadecimal number conversion
Map<String, String> hex_table = {
  '0000': '0',
  '0001': '1',
  '0010': '2',
  '0011': '3',
  '0100': '4',
  '0101': '5',
  '0110': '6',
  '0111': '7',
  '1000': '8',
  '1001': '9',
  '1010': 'A',
  '1011': 'B',
  '1100': 'C',
  '1101': 'D',
  '1110': 'E',
  '1111': 'F',
};

// function to take a binary string and to return hex value
String binary_to_hexadecimal(String binString) {
  // checking for unexpected values
  binString = binString.trim();
  if (binString == '') {
    throw FormatException('An empty value was passed to the function');
  }
  try {
    int.parse(binString);
  } catch (e) {
    throw FormatException('An invalid value was passed to the function');
  }

  // negative number check
  bool isNegative = binString[0] == '-';
  if (isNegative) binString = binString.substring(1);

  // add min 0's in the end to make right substring length divisible by 4
  var lenBin = binString.length;
  for (int i = 1; i <= (4 - lenBin % 4) % 4; i++) {
    binString = '0$binString';
  }

  // coverting the binary values to hex by diving into substring
  String hexVal = '';
  int i = 0;
  while (i != binString.length) {
    String binCurr = binString.substring(i, i + 4);
    hexVal += hex_table[binCurr]!;
    i += 4;
  }

  // returning the value
  if (isNegative) {
    return '-$hexVal';
  }
  return hexVal;
}

// driver function
void main() {
  test('binary_to_hexadecimal -1111', () {
    expect(binary_to_hexadecimal('-1111'), equals('-F'));
  });

  test('binary_to_hexadecimal 101011', () {
    expect(binary_to_hexadecimal('101011'), equals('2B'));
  });

  test('binary_to_hexadecimal rasies error when number is invalid', () {
    expect(() => binary_to_hexadecimal('-1011a01'), throwsFormatException);
  });

  test('binary_to_hexadecimal of empty string raises error', () {
    expect(() => binary_to_hexadecimal(''), throwsFormatException);
  });
}
