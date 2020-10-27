/**
 * Project Euler Problem 10: https://projecteuler.net/problem=10
 * Summation of primes
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * Find the sum of all the primes below two million.
 */

import 'dart:math';
import 'package:test/test.dart';

void main() {
  print("Solution 1 => ${solution1(2000000)}");
  print("Solution 2 => ${solution2(2000000)}");

  test("Test isPrime", () {
    expect(isPrime(-2), false);
    expect(isPrime(0), false);
    expect(isPrime(1), false);
    expect(isPrime(2), true);
  });

  test("Test solution1", () {
    expect(solution1(10), 17);
    expect(solution1(20), 77);
  });

  test("Test solution2", () {
    expect(solution2(10), 17);
    expect(solution2(20), 77);
  });
}

int solution1(int n) {
  var sum = 0;

  for (int i = 2; i < n; i++) {
    if (isPrime(i)) sum += i;
  }
  return sum;
}

int solution2(int n) {
  if (n <= 2) return 0;
  if (n <= 3) return 2;

  var sum = 5;
  var i = 5;

  while (i < n) {
    if (isPrime(i)) sum += i;
    i += 2;
    if (i < n && isPrime(i)) sum += i;
    i += 4;
  }
  return sum;
}

bool isPrime(int number) {
  if (number <= 1) return false;

  var root = sqrt(number).floor();

  for (int div = 2; div <= root; div++) {
    if (number % div == 0) return false;
  }

  return true;
}
