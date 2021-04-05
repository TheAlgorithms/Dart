import "dart:math" show pow;

Map<String, int> hex_table = {
  "A": 10,
  "B": 11,
  "C": 12,
  "D": 13,
  "E": 14,
  "F": 15,
};
void main() {
  print(hexadecimal_to_decimal("1abc")); // 6844

  print(hexadecimal_to_decimal(" -123 ")); // -291
  try {
    print(hexadecimal_to_decimal("1x")); //error
  } catch (ex) {
    print(ex);
  }
}

int hexadecimal_to_decimal(String hex_string) {
  hex_string = hex_string.trim().toUpperCase();
  if (hex_string == null || hex_string == "") {
    throw Exception("An empty value was passed to the function");
  }
  bool is_negative = hex_string[0] == "-";
  if (is_negative) hex_string = hex_string.substring(1);
  int decimal_val = 0;
  for (int i = 0; i < hex_string.length; i++) {
    if (int.parse(hex_string[i], onError: (e) => null) == null &&
        hex_table.containsKey(hex_string[i]) == false) {
      throw Exception("Non-hex value was passed to the function");
    } else {
      decimal_val += pow(16, hex_string.length - i - 1) *
          int.parse((hex_string[i]), onError: (e) => hex_table[hex_string[i]]);
    }
  }
  return is_negative ? -1 * decimal_val : decimal_val;
}
