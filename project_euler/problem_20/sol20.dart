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
      var matcher = 1;
      var actual = sum(1);
      expect(actual, matcher);
    });

    test("Test 2", () {
      var matcher = 3;
      var actual = sum(5);
      expect(actual, matcher);
    });

    test("Test 3", () {
      var matcher = 27;
      var actual = sum(10);
      expect(actual, matcher);
    });
  });
}
