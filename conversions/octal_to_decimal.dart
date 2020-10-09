import "dart:math" show pow;

void main() {
  print(octal_to_decimal("123")); // 83
  print(octal_to_decimal(" -272 ")); // -186
  print(octal_to_decimal("8z")); //error
}

int octal_to_decimal(String oct_string) {
  oct_string = oct_string.trim();
  if (oct_string == null || oct_string == "") {
    throw Exception("An empty value was passed to the function");
  }
  bool is_negative = oct_string[0] == "-";
  if (is_negative) oct_string = oct_string.substring(1);
  int decimal_val = 0;
  for (int i = 0; i < oct_string.length; i++) {
    int oct_value = int.parse(oct_string[i],onError: (_)=>-1);
    if (oct_value == -1 || oct_value > 7) {
      throw Exception("Non-octal value wass passed to the function");
    } else {
      decimal_val +=
          pow(8, oct_string.length - i - 1) * int.parse((oct_string[i]));
    }
  }
  return is_negative ? -1 * decimal_val : decimal_val;
}
