import "dart:math" show pow;
import 'package:test/test.dart';

// octal number to binary number conversion
String ocatal_to_binary(String oct_val) {
  // checking for unexpected values
  oct_val = oct_val.trim();
  if (oct_val.isEmpty) {
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
  int dec_val = 0, i = 0, bin_val = 0;
  while (oct != 0) {
    dec_val = dec_val + ((oct % 10) * pow(8, i).toInt());
    i++;
    oct = oct ~/ 10;
  }

  // converting to decimal to binary
  i = 1;
  while (dec_val != 0) {
    bin_val = bin_val + (dec_val % 2) * i;
    dec_val = dec_val ~/ 2;
    i = i * 10;
  }

  // returning the value
  if (is_negative) {
    return "-" + bin_val.toString();
  }
  return bin_val.toString();
}

void main() {
  test("ocatal_to_binary 75", () {
    expect(ocatal_to_binary("75"), equals("111101"));
  });

  test("ocatal_to_binary -62", () {
    expect(ocatal_to_binary("-62"), equals("-110010"));
  });

  test("ocatal_to_binary rasies error when number is invalid", () {
    expect(() => ocatal_to_binary("84"), throwsFormatException);
  });

  test("ocatal_to_binary rasies error when number is invalid", () {
    expect(() => ocatal_to_binary("as23"), throwsFormatException);
  });

  test("ocatal_to_binary of empty string raises error", () {
    expect(() => ocatal_to_binary(""), throwsFormatException);
  });
}
