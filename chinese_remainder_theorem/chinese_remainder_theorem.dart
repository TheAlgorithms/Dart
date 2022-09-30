// Function to calculate modulo inverse.
int modular_inverse(int a, int m) {
  // Temporary variable to store m to use later.
  int temp = m;

  if (m == 1) {
    return 0;
  }

  int y = 0, x = 1, temp2, quotient, remainder;

  // Calculating x and y based on Euclid's algorithm
  while (a > 1) {
    quotient = (a / m).floor();
    remainder = a % m;
    a = m;
    m = remainder;
    temp2 = y;
    y = x - quotient * y;
    x = temp2;
  }

  // Making x positive if found negative
  if (x < 0) {
    x += temp;
  }

  return x;
}

// Driver function of the program
void main() {
  // Taking input of the number array (num[i]).
  print("Enter array of pairwise co-prime numbers:");

  List numbers = [9, 8, 5, 7, 1];

  // Taking input of remainder array (rem[i]).
  print("Enter remainders:");

  List remainders = [1, 2, 3, 4, 5];

  num product = 1;

  // Length of the 'numbers' list.
  int length = numbers.length;

  // Finding product of all the numbers.
  for (int i = 0; i < length; i++) {
    product *= numbers[i];
  }

  int temp;
  num result = 0;

  // Summing the required values for all i according to the formula.
  for (int i = 0; i < length; i++) {
    temp = (product / numbers[i]).floor();
    result += temp * (remainders[i]) * modular_inverse(temp, numbers[i]);
  }

  result = result % product;

  // Printing result
  print("The value of 'x' by Chinese Remainder Theorem is $result.");
}
