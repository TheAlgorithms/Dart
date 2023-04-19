import 'dart:math';

double gamma(double x) {
  const double pi = 3.141592653589793;
  if (x < 0.5) {
    return pi / (sin(pi * x) * gamma(1 - x));
  }
  x -= 1;
  double a = 0.99999999999980993;
  const List<double> p = [
    676.5203681218851, -1259.1392167224028, 771.32342877765313,
    -176.61502916214059, 12.507343278686905, -0.13857109526572012,
    9.9843695780195716e-6, 1.5056327351493116e-7
  ];
  for (int i = 0; i < p.length; i++) {
    a += p[i] / (x + i + 1);
  }
  double t = x + p.length - 0.5;
  return sqrt(2 * pi) * pow(t, x + 0.5) * exp(-t) * a;
}

double factorial(num n) {
  if (n is int) {
    assert(n >= 0, "Factorial of a negative number does not exist");
  }
  return gamma(n + 1);
}

double signedFactorial(int n) {
  if (n % 2 == 0) {
    return factorial(n);
  } else {
    return -factorial(n);
  }
}