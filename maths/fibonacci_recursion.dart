/* Driver */
void main() {
  assert(fibonacci(1) == 1);
  assert(fibonacci(2) == 1);
  assert(fibonacci(3) == 2);
  assert(fibonacci(4) == 3);
  assert(fibonacci(5) == 5);
  assert(fibonacci(8) == 21);
}

/**
 * get Nth item of fibonacci
 * fibonacci: 1 1 2 3 5 8 13 21 ...
 */
int fibonacci(int n) =>
    n == 1 || n == 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2);
