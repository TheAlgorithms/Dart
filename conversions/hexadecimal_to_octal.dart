import "dart:math" show pow;
import 'package:test/test.dart';

// Hexadecimal number to octal number conversion program
String hexadecimal_to_octal(String hex_val) {
  int dec = 0;

  // checking for null string passed to function
  if (hex_val == "") {
    throw new FormatException("An empty value was passed to the function");
  }

  // negative number check
  bool is_negative = hex_val[0] == "-";
  if (is_negative) hex_val = hex_val.substring(1);
  int c = hex_val.length - 1;

  // finding the decimal equivalent of the hexa decimal number
  for (int i = 0; i < hex_val.length; i++) {
    var ch = hex_val.substring(i, i + 1);
    switch (ch) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        dec = dec + (int.tryParse(ch) ?? 0) * pow(16, c).toInt();
        c--;
        break;
      case 'a':
      case 'A':
        dec = dec + 10 * pow(16, c).toInt();
        c--;
        break;
      case 'b':
      case 'B':
        dec = dec + 11 * pow(16, c).toInt();
        c--;
        break;
      case 'c':
      case 'C':
        dec = dec + 12 * pow(16, c).toInt();
        c--;
        break;
      case 'd':
      case 'D':
        dec = dec + 13 * pow(16, c).toInt();
        c--;
        break;
      case 'e':
      case 'E':
        dec = dec + 14 * pow(16, c).toInt();
        c--;
        break;
      case 'f':
      case 'F':
        dec = dec + 15 * pow(16, c).toInt();
        c--;
        break;
      default:
        throw new FormatException(
            "An invalid value was passed to the function");
    }
  }

  // String oct to store the octal equivalent of a hexadecimal number.
  String oct_val = "";

  // Converting decimal to octal number.
  while (dec > 0) {
    oct_val = (dec % 8).toString() + oct_val;
    dec = dec ~/ 8;
  }

  // Returning the value
  if (is_negative) {
    return "-" + oct_val;
  }
  return oct_val;
}

void main() {
  // Test cases with various input
  test("hexadecimal_to_octal 43DF", () {
    expect(hexadecimal_to_octal("43DF"), equals("41737"));
  });

  test("hexadecimal_to_octal -2CB", () {
    expect(hexadecimal_to_octal("-2CB"), equals("-1313"));
  });

  test("hexadecimal_to_octal rasies error when number is invalid", () {
    expect(() => hexadecimal_to_octal("AIO"), throwsFormatException);
  });

  test("hexadecimal_to_octal of empty string raises error", () {
    expect(() => hexadecimal_to_octal(""), throwsFormatException);
  });
}
