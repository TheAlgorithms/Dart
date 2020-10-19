import 'package:test/test.dart';

//Binary number to hexadecimal number conversion
Map<String, String> hex_table = {
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
String binary_to_hexadecimal(String bin_string) {
  // checking for unexpected values
  bin_string = bin_string.trim();
  if (bin_string == null || bin_string == "") {
    throw new FormatException("An empty value was passed to the function");
  }
  try {
    int.parse(bin_string);
  } catch (e) {
    throw new FormatException("An invalid value was passed to the function");
  }

  // negative number check
  bool is_negative = bin_string[0] == "-";
  if (is_negative) bin_string = bin_string.substring(1);

  // add min 0's in the end to make right substring length divisible by 4
  var len_bin = bin_string.length;
  for (int i = 1; i <= (4 - len_bin % 4) % 4; i++)
    bin_string = '0' + bin_string;

  // coverting the binary values to hex by diving into substring
  String hex_val = "";
  int i = 0;
  while (i != bin_string.length) {
    String bin_curr = bin_string.substring(i, i + 4);
    hex_val += hex_table[bin_curr];
    i += 4;
  }

  // returning the value
  if (is_negative) {
    return "-" + hex_val;
  }
  return hex_val;
}

// driver function
void main() {
  test("binary_to_hexadecimal -1111", () {
    expect(binary_to_hexadecimal("-1111"), equals("-F"));
  });

  test("binary_to_hexadecimal 101011", () {
    expect(binary_to_hexadecimal("101011"), equals("2B"));
  });

  test("binary_to_hexadecimal rasies error when number is invalid", () {
    expect(() => binary_to_hexadecimal("-1011a01"), throwsFormatException);
  });

  test("binary_to_hexadecimal of empty string raises error", () {
    expect(() => binary_to_hexadecimal(""), throwsFormatException);
  });
}
