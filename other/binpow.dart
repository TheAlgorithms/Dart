// Effective computation of large exponents modulo a number
// Function binpow to calculate (x^n mod m)
int binPow(int a, int b, int m) {
  int result = 1;
  a %= m;
  if (a == 0) return 0;
  while (b > 0) {
    if (b % 2 == 1) {
      result = (result * a) % m;
    }
    b >>= 1;
    a = (a * a) % m;
  }
  return result;
}

void main() {
  print('binary power of (2,5,13) = ' + binPow(2, 5, 13).toString());
  print('binary power of (5, 3,13) = ' + binPow(5, 3, 13).toString());
}
