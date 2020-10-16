@Skip('currently failing (see issue #86)')

import 'package:test/test.dart';

/*
 Fermat's little Theorem
 Translated from TheAlgorithms/Python
*/
binary_exponentiation(a, n, mod) {
  if (n == 0) {
    return 1;
  } else if (n % 2 == 1) {
    return (binary_exponentiation(a, n - 1, mod) * a) % mod;
  }
  int b = binary_exponentiation(a, n / 2, mod);

  return (b * b) % mod;
}

void main() {
  // a prime number
  int p = 701;

  double a = 1000000000;
  int b = 10;

  // using binary exponentiation function, O(log(p)):
  print((a / b) % p == (a * binary_exponentiation(b, p - 2, p)) % p);

  // using Python operators:
  print((a / b) % p == (a * b ^ (p - 2)) % p);
}
