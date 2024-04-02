///Author: Shawn
///Email: stepfencurryxiao@gmail.com

/*
 * 
 * Concerting Integers into Roman Numerals
 * 
 */

List<int> ArabianRomanNumbers = [
  1000,
  900,
  500,
  400,
  100,
  90,
  50,
  40,
  10,
  9,
  5,
  4,
  1
];

List<String> RomanNumbers = [
  "M",
  "CM",
  "D",
  "CD",
  "C",
  "XC",
  "L",
  "XL",
  "X",
  "IX",
  "V",
  "IV",
  "I"
];

List<String> integer_to_roman(int num) {
  if (num < 0) {
    return [];
  }

  List<String> result = [];
  for (int i = 0; i < ArabianRomanNumbers.length; i++) {
    int times = num ~/ ArabianRomanNumbers[i];
    for (int j = 0; j < times; j++) {
      print(RomanNumbers[i]);
    }
    num -= times * ArabianRomanNumbers[i];
  }

  return result;
}

int main() {
  /* IV */
  integer_to_roman(4);
  /* II */
  integer_to_roman(2);
  /* M */
  integer_to_roman(1000);
  return 0;
}
