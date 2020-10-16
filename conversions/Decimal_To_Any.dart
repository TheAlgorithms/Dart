//Convert a Decimal Number to Any Other Representation
//https://en.wikipedia.org/wiki/Positional_notation#Base_conversion

void main() {
  print(decimal_to_any(0, 2)); //Expected '0'
  print(decimal_to_any(5, 4)); //Expected '11'
  print(decimal_to_any(20, 3)); //Expected '202'
  print(decimal_to_any(-58, 16)); //Expected '-3A'
  print(decimal_to_any(243, 17)); //Expected 'E5'
  print(decimal_to_any(34923, 36)); //Expected 'QY3'
  print(decimal_to_any(10, 11)); //Expected 'A'
  print(decimal_to_any(-16, 16)); //Expected '-10'
  print(decimal_to_any(36, 36)); //Expected '10'

  try {
    print(decimal_to_any(10, 37)); //Expected Error
  } on FormatException {
    print("Base value is not supported");
  }
}

String decimal_to_any(int value, int base) {
  var ALPHABET_VALUES = {
    10: 'A',
    11: 'B',
    12: 'C',
    13: 'D',
    14: 'E',
    15: 'F',
    16: 'G',
    17: 'H',
    18: 'I',
    19: 'J',
    20: 'K',
    21: 'L',
    22: 'M',
    23: 'N',
    24: 'O',
    25: 'P',
    26: 'Q',
    27: 'R',
    28: 'S',
    29: 'T',
    30: 'U',
    31: 'V',
    32: 'W',
    33: 'X',
    34: 'Y',
    35: 'Z'
  };

  if (value == 0) return "0";

  if (base < 2 || base > 36) throw FormatException("Base not supported!");

  bool negative = false;
  if (value < 0) {
    negative = true;
    value *= -1;
  }

  String output = "";
  while (value > 0) {
    int remainder = value % base;
    value = value ~/ base;
    output =
        (remainder < 10 ? remainder.toString() : ALPHABET_VALUES[remainder]) +
            output;
  }

  return negative ? '-' + output : output;
}
