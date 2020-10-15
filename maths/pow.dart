void main() {
  print(pow(10, 2)); // 100
  print(pow(2, 0)); // 1
  print(pow(2, 10)); // 1024
}

double pow(int a, int b) {
  double result = 1;
  for (int i = 1; i <= b; i++) {
    result *= a;
  }
  return result;
}
