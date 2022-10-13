import "dart:math" show pow;

int binaryToDecimal(String binaryString) {
  binaryString = binaryString.trim();
  if (binaryString == null || binaryString == "") {
    throw Exception("An empty value was passed to the function");
  }
  bool isNegative = binaryString[0] == "-";
  if (isNegative) binaryString = binaryString.substring(1);
  int decimalValue = 0;
  for (int i = 0; i < binaryString.length; i++) {
    if ("01".contains(binaryString[i]) == false) {
      throw Exception("Non-binary value was passed to the function");
    } else {
      decimalValue += pow(2, binaryString.length - i - 1) * int.parse((binaryString[i]));
    }
  }
  return isNegative ? -1 * decimalValue : decimalValue;
}

void main() {
  print(binaryToDecimal("-111")); // -7
  print(binaryToDecimal(" 101011 ")); // 43
  try {
    print(binaryToDecimal("1a1")); //error
  } catch (ex) {
    print(ex);
  }
}
