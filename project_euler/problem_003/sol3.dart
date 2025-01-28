//Title:Project Euler Prob 3
// Author:Shivam Verma
// Email:shivamthegreat.sv@gmail.com

// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143 ?

void main() {
  double i, n = 600851475143;

  for (i = 3; n > 1; i += 2) while (n % i == 0) n /= i;

  print(i - 2);
}
