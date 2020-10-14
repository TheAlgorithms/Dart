import 'dart:math';

double sigmoid(
    double x, double a) //x is the function variable and a is the gain
{
  double p = exp(-a * x);
  return 1 / (1 + p);
}

void main() {
  double gain = 1.00, x = 0.5;
  double p = sigmoid(x, gain);
  print(p);
}
