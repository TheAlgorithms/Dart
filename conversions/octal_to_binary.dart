import 'package:test/test.dart';

// octal number to binary number conversion
int ocatal_to_binary(String oct_val) {
  // checking for unexpected values
  oct_val = oct_val.trim();
  if (oct_val == null || oct_val == "") {
    throw new FormatException("An empty value was passed to the function");
  }

  try {
    // Actual conversion of Octal to Decimal:
    int outputDecimal = int.parse(oct_val);
    return outputDecimal;
  } catch (e) {
    throw new FormatException("An empty value was passed to the function");
  }
}

void main() {
  print(ocatal_to_binary(""));
}
