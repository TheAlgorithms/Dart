///Author: Shawn
///Email: stepfencurryxiao@gmail.com

/*
 * [Problem 1](https://projecteuler.net/problem=1) solution 
 * Problem Statement:
 * If we list all the natural numbers below 10 that are multiples of 3
 * or 5,
 * we get 3,5,6 and 9. The sum of these multiples is 23.
 * Find the sum of all the multiples of 3 or 5 below N.
 */

int sol(int t) {
  int sum = 0;
  int terms = (t - 1) ~/ 3;
  sum += ((terms) * (6 + (terms - 1) * 3)) ~/ 2; // sum of an A.P.
  terms = (t - 1) ~/ 5;
  sum += ((terms) * (10 + (terms - 1) * 5)) ~/ 2;
  terms = (t - 1) ~/ 15;
  sum -= ((terms) * (30 + (terms - 1) * 15)) ~/ 2;

  return sum;
}

int main() {
  int value = sol(4);
  print("solution(4): $value");
  value = sol(3);
  print("solution(3): $value");
  return 0;
}
