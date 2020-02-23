/// Approximate definite integral of f in [a, b] interval
double simpson(double Function(double) f, double a, double b, int n) {
  if (n <= 0) {
    throw ArgumentError("n have to be greater than 0");
  }

  double step = (b - a) / n;
  double sum = f(a) + f(b);

  for (int i = 1; i < n; i++) {
    if (i % 2 == 0) {
      sum += 2 * f(a + i * step);
    } else {
      sum += 4 * f(a + i * step);
    }
  }

  return (step / 3) * sum;
}

double f(double x) {
  return x * x + 2 * x + 7;
}

void main() {
  print(simpson(f, 0, 10, 10));
}
