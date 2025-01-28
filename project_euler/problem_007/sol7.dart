// Author : Devmaufh
// Email : mau1361317@gmail.com

/**
 * [Problem 7](https://projecteuler.net/problem=7) solution
 * Problem Statement:
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 * What is the 10 001st prime number?
 */

void main() {
  int numberOfPrimes = 0;
  int number = 1;
  while (numberOfPrimes < 10001) {
    number++;
    if (isPrime(number)) {
      numberOfPrimes++;
    }
  }
  print(" 10 001st prime number is => $number ");
}

bool isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i < number; i++) if (number % i == 0) return false;
  return true;
}
