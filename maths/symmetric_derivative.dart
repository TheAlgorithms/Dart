import 'dart:math';

/// Approximate derivative of [f] at [x]
double derivative(double Function(double) f, double x, [double h = 1e-10]) {
  return (f(x + h) - f(x - h)) / (2 * h);
}

void main() {
  print("derivative(sin, pi) = ${derivative(sin, pi)}, cos(pi) = ${cos(pi)}");
  print(
      "derivative(sin, 2 * pi) = ${derivative(sin, 2 * pi)}, cos(2 * pi) = ${cos(2 * pi)}");
  print("derivative(exp, 3) = ${derivative(exp, 3)}, exp(3) = ${exp(3)}");
}
