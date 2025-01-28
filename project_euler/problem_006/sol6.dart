/// Author: Pasan Godamune
/// Email: pasanjg@gmail.com

/**
 * [Problem 6](https://projecteuler.net/problem=6) solution
 * Problem Statement:
 * The sum of the squares of the first ten natural numbers is,
 * 1^2 + 2^2 + … + 10^2 = 385
 * The square of the sum of the first ten natural numbers is,
 * (1 + 2 + … + 10)^2 = 552 = 3025
 * Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
 * Find the difference between the sum of the squares of the first one hundred natural numbers natural numbers and the square of the sum.
 */

import 'dart:math';

squareDifference(n) {
  return squareSumOfFirst(n) - sumOfSquare(n);
}

sumOfSquare(n) {
  return (((n * (n + 1)) * (n + (n + 1))) / 6);
}

squareSumOfFirst(n) {
  return pow((n + 1) * (n / 2), 2);
}

void main() {
  int n = 100;
  print(squareDifference(n));

  /// 25164150
}
