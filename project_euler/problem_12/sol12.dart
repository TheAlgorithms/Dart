import 'dart:math';

List<int> prime_sieve(int limit) {
  int sieve_bound = (limit - 1) ~/ 2;
  int upper_sqrt = (sqrt(limit).toInt() - 1) ~/ 2;
  List<bool> prime_bits = List.generate(sieve_bound + 1, (_) => true);

  for (int i = 1; i <= upper_sqrt; ++i)
    if (prime_bits[i])
      for (int j = i * (i + 1) * 2; j <= sieve_bound; j += 2 * i + 1)
        prime_bits[j] = false;

  List<int> primes = [2];
  for (int i = 1; i <= sieve_bound; ++i)
    if (prime_bits[i]) primes.add(2 * i + 1);

  return primes;
}

int prime_factorisation_number_of_divisors(int n, List<int> primes) {
  int nod = 1;
  int remain = n;
  for (int i = 0; i < primes.length; ++i) {
    if (primes[i] * primes[i] > n) return nod * 2;
    int power = 1;
    while (remain % primes[i] == 0) {
      power += 1;
      remain ~/= primes[i];
    }
    nod *= power;
    if (remain == 1) break;
  }
  return nod;
}

void main() {
  int i = 2;
  int count = 0;
  int odd = 2;
  int even = 2;
  List<int> primes = prime_sieve(500);
  while (count < 500) {
    even = i % 2 == 0
        ? prime_factorisation_number_of_divisors(i + 1, primes)
        : even;
    odd = i % 2 != 0
        ? prime_factorisation_number_of_divisors((i + 1) ~/ 2, primes)
        : odd;
    count = even * odd;
    ++i;
  }
  int ans = (i * (i - 1) * 0.5).toInt();
  print("First Triangle Number with more than 500 divisors: $ans");
}
