void main() {
  print(decimal_to_octal(-123));
  print(decimal_to_octal(0));
  print(decimal_to_octal(404));
}

String decimal_to_octal(int decimalVal) {
  if (decimalVal == 0) {
    return '0';
  }
  bool negative = false;
  if (decimalVal < 0) {
    negative = true;
    decimalVal *= -1;
  }
  String octString = '';
  while (decimalVal > 0) {
    int remainder = decimalVal % 8;
    decimalVal = decimalVal ~/ 8;
    octString = remainder.toString() + octString;
  }
  return negative ? '-$octString' : octString;
}
