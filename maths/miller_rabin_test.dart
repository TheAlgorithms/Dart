import 'package:test/test.dart';

void main() {
  test('check for 1', () {
    expect(miller_rabin(1), equals(false));
  });
  test('check for 2', () {
    expect(miller_rabin(2), equals(true));
  });
  test('check for 351613', () {
    expect(miller_rabin(351613), equals(false));
  });
  test('check for 839161', () {
    expect(miller_rabin(839161), equals(true));
  });
  test('check for 31718227', () {
    expect(miller_rabin(31718227), equals(true));
  });
  test('check for 57944311', () {
    expect(miller_rabin(57944311), equals(false));
  });
  test('check for 140104061', () {
    expect(miller_rabin(140104061), equals(false));
  });
  test('check for 615665551', () {
    expect(miller_rabin(615665551), equals(true));
  });
  test('check for 1389534221', () {
    expect(miller_rabin(1389534221), equals(true));
  });
}

/*
 * following functions implement the deterministic Miller Rabin's primality test
 * this implementation will check for the prime bases: 2, 3, 5 and 7
 * which is enough to check primality of all 32 bit integers
 * ref: https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
 */

/**
 * helper function used by Miller Rabin test
 * solves for base to the power exp modulo mod
 * using binary exponentiation
 * ref: https://en.wikipedia.org/wiki/Exponentiation_by_squaring
 */
int binpower(int base, int power, int mod) {
  int result = 1;
  base %= mod;
  while (power > 0) {
    if ((power & 1) > 0) result = (result * base) % mod;
    base = (base * base) % mod;
    power >>= 1;
  }
  return result;
}

/**
 * helper function used by Miller Rabin's test to check if a number is
 * composite with respect to a given base
 */
bool check_composite(int num, int base, int d, int s) {
  int x = binpower(base, d, num);
  if (x == 1 || x == num - 1) return false;
  for (int r = 1; r < s; r++) {
    x = x * x % num;
    if (x == num - 1) return false;
  }
  return true;
}

/**
 * returns true if n is prime, else returns false.
 * This implementation can check every 31 bit positive integer.
 * 31 bit since multiplying two 32 bit signed integer would result in overflow.
 */
bool miller_rabin(int num) {
  if (num < 2) return false;

  // compute s and odd value d such that (2^s)*d = n-1
  int s = 0;
  int d = num - 1;
  while ((d & 1) == 0) {
    d >>= 1;
    s++;
  }

  for (int base in [2, 3, 5, 7]) {
    if (num == base) return true;
    if (check_composite(num, base, d, s)) return false;
  }

  return true;
}
