// Program Linear Diophantine equation

//Find the GCD of two numbers
int gcd(int a, int b) {
  return (a % b == 0) ? b.abs() : gcd(b, a % b);
}

// This function checks if integral solutions are possible
bool Isposs(int a, int b, int c) {
  return (c % gcd(a, b) == 0);
}

//Driver function for Linear Diophantine Equations
int main() {
  int a = 3, b = 6, c = 9;
  if (Isposs(a, b, c) == true) {
    print("Possible");
  } else {
    print("Not Possible");
  }
  int x = 3, y = 6, z = 8;
  if (Isposs(x, y, z) == true) {
    print("Possible");
  } else {
    print("Not Possible");
  }

  return 0;
}
