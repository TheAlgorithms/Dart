// Author : Devmaufh
// Email : mau1361317@gmail.com

/**
 * [Problem 5](https://projecteuler.net/problem=5) solution
 * Problem Statement:
 * 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 * What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 */

void main() {
  int number = 21;
  LOOP:
  while (true) {
    bool isSolution = true;
    for (int i = 1; i <= 21; i++) {
      if (number % i != 0) {
        isSolution = false;
        break; // Break if have a remainder
      }
    }
    if (isSolution)
      break LOOP; //If any number hasn't a remainder, break main loop because we found the solution
    number++;
  }
  print("Solution problem 5 = $number");
}
