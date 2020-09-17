import "dart:math" show pow;

void main() {
  print(octal_to_decimal("172612")); // 62858
  print(octal_to_decimal(" -16123 ")); // -7251
  print(octal_to_decimal("abcd")); //error
}

int octal_to_decimal(String oct_string) {
  oct_string = oct_string.trim();
  if (oct_string == null || oct_string == "") {
    throw Exception("An empty value was passed to the function");
  }
  bool isNegative = oct_string[0] == "-";
  if (isNegative) oct_string = oct_string.substring(1);
  int decimal_val = 0;
  for (int i = 0; i < oct_string.length; i++) {
    int oct_value = int.parse(oct_string[i], onError: (e) => null);
    if (oct_value == null || oct_value > 7 || oct_value < 0) {
      throw Exception("Non-octal value wass passed to the function");
    } else {
      decimal_val += pow(8, oct_string.length - i - 1) * oct_value;
    }
  }
  return isNegative ? -1 * decimal_val : decimal_val;
}
