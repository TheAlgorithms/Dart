import 'dart:math';

/// Approximate derivative of [f] at [x]
double derivative(double Function(double) f, double x, [double h = 1e-10]) {
  return (f(x + h) - f(x - h)) / (2 * h);
}

/// Find root of given [f] (x where [f(x)] == 0)
double findRoot(double Function(double) f,
    [double initialValue = 0, int iterations = 10, double h = 1e-10]) {
  double currentValue = initialValue;
  for (int i = 0; i < iterations; i++) {
    currentValue -= f(currentValue) / derivative(f, currentValue);
  }

  return currentValue;
}

double f(x) {
  return 2 * x + 4;
}

double g(x) {
  return 2 * pow(x, 2) + 7 * x + 1;
}

main() {
  double fRoot = findRoot(f);
  double gRoot = findRoot(g);
  double sinRoot = findRoot(sin, 10);

  print("f(x) = 2x + 4, f($fRoot) = ${f(fRoot)}");
  print("g(x) = 2x^2 + 7x + 1, g($gRoot) = ${g(gRoot)}");
  print("sin(${sinRoot / pi} * pi) = ${sin(sinRoot)}");
}
