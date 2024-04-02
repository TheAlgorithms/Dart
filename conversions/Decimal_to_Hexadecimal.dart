Map<String, String> hex_table = {
  "10": "A",
  "11": "B",
  "12": "C",
  "13": "D",
  "14": "E",
  "15": "F",
};
void main() {
  print(decimal_to_hexadecimal(-123));
  print(decimal_to_hexadecimal(0));
  print(decimal_to_hexadecimal(404));
}

String decimal_to_hexadecimal(int decimal_val) {
  if (decimal_val == 0) {
    return "0";
  }
  bool negative = false;
  if (decimal_val < 0) {
    negative = true;
    decimal_val *= -1;
  }
  String hex_string = "";
  while (decimal_val > 0) {
    String hex_val = "";
    int remainder = decimal_val % 16;
    decimal_val = decimal_val ~/ 16;
    if (hex_table.containsKey(remainder.toString())) {
      hex_val = hex_table[remainder.toString()] ?? '';
    } else {
      hex_val = remainder.toString();
    }
    hex_string = hex_val + hex_string;
  }
  return negative ? "-" + hex_string : hex_string;
}
