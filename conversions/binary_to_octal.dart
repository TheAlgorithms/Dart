import 'package:test/test.dart';

//Binary number to octal number conversion
void main() {
  test("binary_to_octal -1111", () {
    expect(binaryToOctal("-1111"), equals("-17"));
  });

  test("binary_to_octal 101011", () {
    expect(binaryToOctal("101011"), equals("53"));
  });

  test("binary_to_octal rasies error when number is invalid", () {
    expect(() => binaryToOctal("-1011a01"), throwsFormatException);
  });

  test("binary_to_octal of empty string raises error", () {
    expect(() => binaryToOctal(""), throwsFormatException);
  });
}

String binaryToOctal(String binaryString) {
  binaryString = binaryString.trim();
  if (binaryString.isEmpty) {
    throw new FormatException("An empty value was passed to the function");
  }
  bool isNegative = binaryString[0] == "-";
  if (isNegative) binaryString = binaryString.substring(1);

  String octalValue = "";
  int binary;
  try {
    binary = int.parse(binaryString);
  } catch (e) {
    throw new FormatException("An invalid value was passed to the function");
  }
  int currentBit;
  int j = 1;
  while (binary > 0) {
    int code3 = 0;
    for (int i = 0; i < 3; i++) {
      currentBit = binary % 10;
      binary = binary ~/ 10;
      code3 += currentBit * j;
      j *= 2;
    }
    octalValue = code3.toString() + octalValue;
    j = 1;
  }
  if (isNegative) {
    return "-" + octalValue;
  }
  return octalValue;
}
