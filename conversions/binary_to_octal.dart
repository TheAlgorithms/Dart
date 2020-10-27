import 'package:test/test.dart';

//Binary number to octal number conversion
void main() {
  test("binary_to_octal -1111", () {
    expect(binary_to_octal("-1111"), equals("-17"));
  });

  test("binary_to_octal 101011", () {
    expect(binary_to_octal("101011"), equals("53"));
  });

  test("binary_to_octal rasies error when number is invalid", () {
    expect(() => binary_to_octal("-1011a01"), throwsFormatException);
  });

  test("binary_to_octal of empty string raises error", () {
    expect(() => binary_to_octal(""), throwsFormatException);
  });
}

String binary_to_octal(String bin_string) {
  bin_string = bin_string.trim();
  if (bin_string == null || bin_string == "") {
    throw new FormatException("An empty value was passed to the function");
  }
  bool is_negative = bin_string[0] == "-";
  if (is_negative) bin_string = bin_string.substring(1);

  String octal_val = "";
  int binary;
  try {
    binary = int.parse(bin_string);
  } catch (e) {
    throw new FormatException("An invalid value was passed to the function");
  }
  int curr_bit;
  int j = 1;
  while (binary > 0) {
    int code_3 = 0;
    for (int i = 0; i < 3; i++) {
      curr_bit = binary % 10;
      binary = binary ~/ 10;
      code_3 += curr_bit * j;
      j *= 2;
    }
    octal_val = code_3.toString() + octal_val;
    j = 1;
  }
  if (is_negative) {
    return "-" + octal_val;
  }
  return octal_val;
}
