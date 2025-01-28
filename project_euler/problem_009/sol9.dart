// Author : Devmaufh
// Email : mau1361317@gmail.com

/**
 * [Problem 9](https://projecteuler.net/problem=8) solution
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 * a^2 + b^2 = c^2
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

void main() {
  for (int i = 0; i <= 300; ++i) {
    for (int j = 0; j <= 400; ++j) {
      int k = 1000 - i - j;
      if (i * i + j * j == k * k) {
        var sol = i * j * k;
        print("Solution :  $sol");
        break;
      }
    }
  }
}
