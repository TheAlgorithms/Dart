import 'package:test/test.dart';

// hexadecimal number to binary number conversion
Map<String, String> bin_table = {
  "0": "0",
  "1": "1",
  "2": "10",
  "3": "11",
  "4": "100",
  "5": "101",
  "6": "110",
  "7": "111",
  "8": "1000",
  "9": "1001",
  "A": "1010",
  "B": "1011",
  "C": "1100",
  "D": "1101",
  "E": "1110",
  "F": "1111",
};

// function to take hex value as string and return binary value as string
String hexadecimal_to_binary(String hex_value) {
  // checking for unexpected values
  hex_value = hex_value.trim();
  if (hex_value.isEmpty) {
    throw new FormatException("An empty value was passed to the function");
  }

  // negative number check
  bool is_negative = hex_value[0] == "-";
  if (is_negative) hex_value = hex_value.substring(1);

  // coverting the  hex to binary values by diving into substring
  String bin_val = "";
  int i = 0;
  while (i != hex_value.length) {
    String hex_cur = hex_value.substring(i, i + 1);
    if (!bin_table.containsKey(hex_cur)) {
      throw new FormatException("An invalid value was passed to the function");
    }
    bin_val += bin_table[hex_cur] ?? '';
    i++;
  }

  // returning the value
  if (is_negative) {
    return "-" + bin_val;
  }
  return bin_val;
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
