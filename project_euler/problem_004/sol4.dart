// Author : Devmaufh
// Email : mau1361317@gmail.com

/**
 * [Problem 4](https://projecteuler.net/problem=4) solution
 * Problem Statement:
 * A palindromic number reads the same both ways.
 * The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

void main() {
  int max = 0;
  for (int i = 100; i < 1000; i++) {
    for (int j = 100; j < 1000; j++) {
      int result = i * j;
      if (isPanlindrome("$result")) {
        if (result > max) {
          max = result;
        }
      }
    }
  }
  print("MAX $max");
}

bool isPanlindrome(String word) {
  for (int i = 0; i < word.length ~/ 2; i++) {
    if (word[i] != word[word.length - i - 1]) return false;
  }
  return true;
}
