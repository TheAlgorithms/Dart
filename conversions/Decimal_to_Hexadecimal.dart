Map<String, String> hex_table = {
  '10': 'A',
  '11': 'B',
  '12': 'C',
  '13': 'D',
  '14': 'E',
  '15': 'F',
};
void main() {
  print(decimal_to_hexadecimal(-123));
  print(decimal_to_hexadecimal(0));
  print(decimal_to_hexadecimal(404));
}

String decimal_to_hexadecimal(int decimalVal) {
  if (decimalVal == 0) {
    return '0';
  }
  bool negative = false;
  if (decimalVal < 0) {
    negative = true;
    decimalVal *= -1;
  }
  String hexString = '';
  while (decimalVal > 0) {
    String? hexVal = '';
    int remainder = decimalVal % 16;
    decimalVal = decimalVal ~/ 16;
    if (hex_table.containsKey(remainder.toString())) {
      hexVal = hex_table[remainder.toString()];
    } else {
      hexVal = remainder.toString();
    }
    hexString = hexVal! + hexString;
  }
  return negative ? '-$hexString' : hexString;
}
