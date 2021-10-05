void main() {
  List<int> nums = [
    1, // false
    2, // true
    351613, // false
    839161, // true
    31718227, // true
    57944311, // false
    140104061, // false
    615665551, // true
    1389534221 //
  ];

  for (int num in nums) {
    if (miller_rabin(num)) {
      print("${num} is prime");
    } else {
      print("${num} is not prime");
    }
  }
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
