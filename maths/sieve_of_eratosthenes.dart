/*
  * Source:
  *   https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  * 
  * Description:
  *   Calculates prime numbers till a number n
  * 
  * Time Complexity:
  *   O(n log(log(n)))
  */

List<bool> sieve_of_eratosthenes(int n) {
  // Input: n: int
  // Output: is_prime: List<bool> denoting whether ith element is prime or not
  List<bool> is_prime = new List.filled(n + 1, true);
  is_prime[0] = false;
  is_prime[1] = false;
  for (int i = 2; i * i <= n; i++) {
    if (is_prime[i]) {
      for (int j = i * i; j <= n; j += i) {
        // mark all multiples of i as false
        is_prime[j] = false;
      }
    }
  }
  return is_prime;
}

main() {
  // Prints all the primes under 50
  List<bool> primes = sieve_of_eratosthenes(50);
  for (int i = 2; i <= 50; i++) {
    if (primes[i]) {
      print(i);
    }
  }
}
