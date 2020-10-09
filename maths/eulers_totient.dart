/* Source:
 *   https://en.wikipedia.org/wiki/Euler%27s_totient_function
 * 
 * Description:
 *   eulers_totient(n) = n * product(1 - 1/p for all prime p dividing n)
 * 
 * Time Complexity:
 *   O(sqrt(n))
 */

int eulers_totient(int n) {
  // Input: n: int
  // Output: phi(n): count of numbers b/w 1 and n that are coprime to n
  int res = n;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      while (n % i == 0) {
        n = n ~/ i;
      }
      // i is a prime dividing n, multiply res bu 1 - 1/i
      // res = res * (1 - 1/i) = res - (res/i)
      res = res - (res ~/ i);
    }
  }
  if (n > 1) {
    res = res - (res ~/ n);
  }
  return res;
}

main() {
  // eulers_totient(9) = 6 as 1, 2, 4, 5, 6, 7, 8 are coprime to 9
  // > 6
  print(eulers_totient(9));
  // eulers_totient(10) = 4 as 1, 3, 7, 9 are coprime to 10
  // > 4
  print(eulers_totient(10));
}
