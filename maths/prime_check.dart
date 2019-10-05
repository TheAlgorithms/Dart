import 'dart:math';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 9, 13];
  for (int number in numbers) {
    if (isPrime(number)) {
      print("$number is prime.");
    } else {
      print("$number is not prime.");
    }
  }
}

/**
 *check out whether number is prime number or not.
 */
bool isPrime(int number) {
  if (number == 2) {
    return true;
  }
  if (number <= 1 || number % 2 == 0) {
    return false;
  }

  for (int i = 3, limit = sqrt(number).toInt(); i <= limit; i += 2) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}
