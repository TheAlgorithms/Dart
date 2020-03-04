import 'dart:math';

double sinh(double x) => pow(e, x) - pow(e, -x) / 2;

/// Approximation for gamma([x] + 1) discovered by Srinivasa Ramanujanea
double factorial(double x) {
  return sqrt(pi) *
      pow(x / e, x) *
      pow(8 * pow(x, 3) + 4 * pow(x, 2) + x + 1 / 30, 1 / 6);
}

main(List<String> args) {
  for (int i = 0; i < 10; i++) {
    print("$i! ~= ${factorial(i.toDouble())}");
  }
}
