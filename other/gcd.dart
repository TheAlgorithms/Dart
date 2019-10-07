//This is the Euclidean algorithm.
euclidean_gcd(var a, var b) {
  while (b != 0) {
    var t = b;
    b = a % b;
    a = t;
  }
  return a;
}

void main() {
  print('GCD(1, 4) = ' + euclidean_gcd(1, 4).toString());
  print('GCD(5, 3) = ' + euclidean_gcd(5, 3).toString());
  print('GCD(3, 6) = ' + euclidean_gcd(3, 6).toString());
  print('GCD(8, 4) = ' + euclidean_gcd(8, 4).toString());
}
