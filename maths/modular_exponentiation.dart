import 'package:test/test.dart';

/*
 * Modular exponentiation is a type of exponentiation
 * performed over a modulus.
 * Source: https://en.wikipedia.org/wiki/Modular_exponentiation
 */

void main() {
  test('modularExponentiation for b=3, e=6, m=11', () {
    expect(modularExponentiation(3, 6, 11), equals(3));
  });
  test('modularExponentiation for b=5, e=3, m=13', () {
    expect(modularExponentiation(5, 3, 13), equals(8));
  });
  test('modularExponentiation for b=2, e=7, m=17', () {
    expect(modularExponentiation(2, 7, 17), equals(9));
  });
  test('modularExponentiation for b=7, e=4, m=16', () {
    expect(modularExponentiation(7, 4, 16), equals(1));
  });
}

int modularExponentiation(int base, int exponent, int mod) {
  // initialize result
  int res = 1;
  base = base % mod;

  // don't handle negative powers
  if (exponent < 0) return -1;

  // if base is divisible my mod
  if (base == 0) return 0;

  while (exponent > 0) {
    // if exponent is odd, multiply base with res
    if (exponent % 2 == 1) {
      res = (res * base) % mod;
    }
    // exponent must be even now, so cast to int using ~
    exponent = exponent ~/ 2;
    base = (base * base) % mod;
  }

  return res;
}
