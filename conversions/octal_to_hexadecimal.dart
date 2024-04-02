import "dart:math" show pow;
import 'package:test/test.dart';

// octal number to hex number
Map<String, String> hex_table = {
  "10": "A",
  "11": "B",
  "12": "C",
  "13": "D",
  "14": "E",
  "15": "F",
};
//
// function take octal string value and return hexadecimal string value
String ocatal_to_hex(String oct_val) {
  // checking for unexpected values
  oct_val = oct_val.trim();
  if (oct_val == "") {
    throw new FormatException("An empty value was passed to the function");
  }

  // negative number check
  bool is_negative = oct_val[0] == "-";
  if (is_negative) oct_val = oct_val.substring(1);

  int oct;
  try {
    oct = int.parse(oct_val);
  } catch (e) {
    throw new FormatException("An invalid value was passed to the function");
  }

  // checking number not valid for octal is passed(0-7)
  for (int i = 0; i < oct_val.length; i++) {
    if (!(int.parse(oct_val.substring(i, i + 1)) < 8)) {
      throw new FormatException("An invalid value was passed to the function");
    }
    ;
  }

  // converting octal to decimal
  int dec_val = 0, i = 0;
  while (oct != 0) {
    dec_val = dec_val + ((oct % 10) * pow(8, i).toInt());
    i++;
    oct = oct ~/ 10;
  }

  // converting to decimal to hex
  if (dec_val == 0) {
    return "0";
  }
  String hex_string = "";
  while (dec_val > 0) {
    String hex_val = "";
    int remainder = dec_val % 16;
    dec_val = dec_val ~/ 16;
    if (hex_table.containsKey(remainder.toString())) {
      hex_val = hex_table[remainder.toString()] ?? '';
    } else {
      hex_val = remainder.toString();
    }
    hex_string = hex_val + hex_string;
  }

  // returning the value
  if (is_negative) {
    return "-" + hex_string;
  }
  return hex_string;
}

// driver function
void main() {
  // test input
  test("ocatal_to_hex 75", () {
    expect(ocatal_to_hex("75"), equals("3D"));
  });

  test("ocatal_to_hex -62", () {
    expect(ocatal_to_hex("-62"), equals("-32"));
  });

  test("ocatal_to_hex rasies error when number is invalid", () {
    expect(() => ocatal_to_hex("84"), throwsFormatException);
  });

  test("ocatal_to_hex rasies error when number is invalid", () {
    expect(() => ocatal_to_hex("as23"), throwsFormatException);
  });

  test("ocatal_to_hex of empty string raises error", () {
    expect(() => ocatal_to_hex(""), throwsFormatException);
  });
}
