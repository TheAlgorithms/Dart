//Author:Shawn
//Email:stepfencurryxiao@gmail.com

import "dart:math" show pow;

/*
 * This method converts a decimal number 
 * to a binary number using a bitwise
 * algorithm
 */
void bitwiseConversion(var n) {
  int b = 0, c = 0, d;
  print("Bitwise conversion.\n");
  while (n != 0) {
    d = (n & 1);
    b += d * (pow(10, c++).toInt());
    n >>= 1;
  }
  print("\tBinary number: $b");
}

//Main method
void main() {
  bitwiseConversion(8);
}
