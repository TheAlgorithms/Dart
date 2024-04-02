import 'package:test/test.dart';

//Binary number to hexadecimal number conversion
Map<String, String> hexTable = {
  "0000": '0',
  "0001": '1',
  "0010": '2',
  "0011": '3',
  "0100": '4',
  "0101": '5',
  "0110": '6',
  "0111": '7',
  "1000": '8',
  "1001": '9',
  "1010": 'A',
  "1011": 'B',
  "1100": 'C',
  "1101": 'D',
  "1110": 'E',
  "1111": 'F',
};

// function to take a binary string and to return hex value
String binaryToHexadecimal(String binaryString) {
  // checking for unexpected values
  binaryString = binaryString.trim();
  if (binaryString.isEmpty) {
    throw new FormatException("An empty value was passed to the function");
  }
  try {
    int.parse(binaryString);
  } catch (e) {
    throw new FormatException("An invalid value was passed to the function");
  }

  // negative number check
  bool isNegative = binaryString[0] == "-";
  if (isNegative) binaryString = binaryString.substring(1);

  // add min 0's in the end to make right substring length divisible by 4
  var binaryStringLength = binaryString.length;
  for (int i = 1; i <= (4 - binaryStringLength % 4) % 4; i++)
    binaryString = '0' + binaryString;

  // coverting the binary values to hex by diving into substring
  String hexValue = "";
  int i = 0;
  while (i != binaryString.length) {
    String bin_curr = binaryString.substring(i, i + 4);
    hexValue += hexTable[bin_curr] ?? '';
    i += 4;
  }

  // returning the value
  if (isNegative) {
    return "-" + hexValue;
  }
  return hexValue;
}

// driver function
void main() {
  test("binary_to_hexadecimal -1111", () {
    expect(binaryToHexadecimal("-1111"), equals("-F"));
  });

  test("binary_to_hexadecimal 101011", () {
    expect(binaryToHexadecimal("101011"), equals("2B"));
  });

  test("binary_to_hexadecimal rasies error when number is invalid", () {
    expect(() => binaryToHexadecimal("-1011a01"), throwsFormatException);
  });

  test("binary_to_hexadecimal of empty string raises error", () {
    expect(() => binaryToHexadecimal(""), throwsFormatException);
  });
}
