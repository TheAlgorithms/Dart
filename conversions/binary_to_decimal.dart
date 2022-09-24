import 'dart:math' show pow;

void main() {
  print(binary_to_decimal('-111')); // -7
  print(binary_to_decimal(' 101011 ')); // 43
  try {
    print(binary_to_decimal('1a1')); //error
  } catch (ex) {
    print(ex);
  }
}

int binary_to_decimal(String binString) {
  binString = binString.trim();
  if (binString == '') {
    throw Exception('An empty value was passed to the function');
  }
  bool isNegative = binString[0] == '-';
  if (isNegative) binString = binString.substring(1);
  int decimalVal = 0;
  for (int i = 0; i < binString.length; i++) {
    if ('01'.contains(binString[i]) == false) {
      throw Exception('Non-binary value was passed to the function');
    } else {
      decimalVal +=
          pow(2, binString.length - i - 1) * int.parse((binString[i])) as int;
    }
  }
  return isNegative ? -1 * decimalVal : decimalVal;
}
