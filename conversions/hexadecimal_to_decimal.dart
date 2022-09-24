import 'dart:math' show pow;

Map<String, int> hex_table = {
  'A': 10,
  'B': 11,
  'C': 12,
  'D': 13,
  'E': 14,
  'F': 15,
};
void main() {
  print(hexadecimal_to_decimal('1abc')); // 6844

  print(hexadecimal_to_decimal(' -123 ')); // -291
  try {
    print(hexadecimal_to_decimal('1x')); //error
  } catch (ex) {
    print(ex);
  }
}

int hexadecimal_to_decimal(String hexString) {
  hexString = hexString.trim().toUpperCase();
  if (hexString == '') {
    throw Exception('An empty value was passed to the function');
  }
  bool isNegative = hexString[0] == '-';
  if (isNegative) hexString = hexString.substring(1);
  int decimalVal = 0;
  for (int i = 0; i < hexString.length; i++) {
    if (int.tryParse(hexString[i], radix: 16) == null &&
        hex_table.containsKey(hexString[i]) == false) {
      throw Exception('Non-hex value was passed to the function');
    } else {
      decimalVal += pow(16, hexString.length - i - 1) *
              int.parse(hexString[i], radix: 16) as int? ??
          hex_table[hexString[i]]!;
    }
  }
  return isNegative ? -1 * decimalVal : decimalVal;
}
