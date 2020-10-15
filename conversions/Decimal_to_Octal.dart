void main() {
  print(decimal_to_octal(-123));
  print(decimal_to_octal(0));
  print(decimal_to_octal(404));
}

String decimal_to_octal(int decimal_val) {
  if (decimal_val == 0) {
    return "0";
  }
  bool negative = false;
  if (decimal_val < 0) {
    negative = true;
    decimal_val *= -1;
  }
  String oct_string = "";
  while (decimal_val > 0) {
    int remainder = decimal_val % 8;
    decimal_val = decimal_val ~/ 8;
    oct_string = remainder.toString() + oct_string;
  }
  return negative ? "-" + oct_string : oct_string;
}
