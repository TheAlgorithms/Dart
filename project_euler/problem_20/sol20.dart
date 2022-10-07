/*
Problem 20: Factorial digit sum 

n! means n × (n − 1) × ... × 3 × 2 × 1
For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
Find the sum of the digits in the number 100!
*/

import 'package:test/test.dart';

// To Calculate Factorial
int factorial(int number) {
  int factorial = 1;
  for (int i = number; i >= 1; i--) {
    factorial *= i;
  }
  return factorial;
}

// To Calculate Sum
int sum(int number) {
  int sum = 0;
  for (int i = factorial(number); i > 0; i = (i / 10).floor()) {
    sum += (i % 10);
  }
  return sum;
}

// Driver Code
void main() {
  group("Solution 20", () {
    test("Test 1", () {
      expect(1, sum(1));
    });

    test("Test 2", () {
      expect(3, sum(5));
    });

    test("Test 3", () {
      expect(27, sum(10));
    });
  });
}
