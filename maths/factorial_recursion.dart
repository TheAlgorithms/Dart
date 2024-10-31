void main() {
  int n = 5;
  int fac = factorial(n);
  print("$n! = $fac"); // Output: 5! = 120
}

// Calculates the factorial of a given integer [n].
// Returns 1 if [n] is 0 or 1; otherwise returns n * factorial(n - 1).
int factorial(int n) => n <= 1 ? 1 : n * factorial(n - 1);
