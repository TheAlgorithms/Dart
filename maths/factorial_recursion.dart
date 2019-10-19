void main() {
  var n = 5;
  var fac = factorial(n);
  print("$n! = $fac"); /* output: 5! = 120 */
}

/* calculate factorial of n*/
int factorial(var n) => n == 0 || n == 1 ? 1 : n * factorial(n - 1);
