// Author: ShivangSrivastava
// Email: shivangsrivastava157@gmail.com

/// Converts a decimal number to binary with optional precision for fractional part
/// https://www.geeksforgeeks.org/convert-decimal-fraction-binary-number/
String decimalToBinary(double value, [int precision = 10]) {
  bool isNegative = value.isNegative;
  if (isNegative) {
    value = -value;
  }

  int intPart = value.toInt();
  String binaryOfIntPart = intToBinary(intPart);

  double fracPart = value - intPart;
  String binaryOfFracPart = fracToBinary(fracPart, precision);

  return isNegative
      ? "-$binaryOfIntPart.$binaryOfFracPart"
      : "$binaryOfIntPart.$binaryOfFracPart";
}

/// Converts an integer to binary string
String intToBinary(int value) {
  String binary = "";

  while (value > 0) {
    binary = (value % 2).toString() + binary;
    value = value ~/ 2;
  }

  return binary;
}

/// Converts a fractional part to binary string up to given precision
String fracToBinary(double value, [int precision = 10]) {
  StringBuffer binary = StringBuffer();
  double fraction = value;

  for (int i = 0; i < precision; i++) {
    fraction *= 2;
    if (fraction >= 1) {
      binary.write('1');
      fraction -= 1;
    } else {
      binary.write('0');
    }

    if (fraction == 0) {
      break;
    }
  }

  return binary.toString();
}

void main() {
  String result = decimalToBinary(10.25);
  print(result);
}
