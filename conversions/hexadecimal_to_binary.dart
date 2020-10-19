import 'package:test/test.dart';

// hexadecimal number to binary number conversion
Map<String, String> hex_table = {
  "0" : "0",
  "1" : "1",
  "2" : "10",
  "3" : "11",
  "4" : "100",
  "5" : "101",
  "6" : "110",
  "7" : "111",
  "8" : "1000",
  "9" : "1001",
  "A" : "1010",
  "B" : "1011",
  "C" : "1100",
  "D" : "1101",
  "E" : "1110",
  "F" : "1111",
};

int hexadecimal_to_binary(String hex_value) {
}

void main() {
  test("hexadecimal_to_binary -F", () {
    expect(hexadecimal_to_binary("-F"), equals("-1111"));
  });

  test("hexadecimal_to_binaryl 2B", () {
    expect(hexadecimal_to_binary("2B"), equals("101011"));
  });

  test("hexadecimal_to_binary rasies error when number is invalid", () {
    expect(() => hexadecimal_to_binary("AIO"), throwsFormatException);
  });

  test("hexadecimal_to_binary of empty string raises error", () {
    expect(() => hexadecimal_to_binary(""), throwsFormatException);
  });
}