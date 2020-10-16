/* 
 * From: https://www.britannica.com/science/perfect-number
 *
 * A positive integer that is equal to the sum of its proper divisors. 
 * The smallest perfect number is 6, which is the sum of 1, 2, and 3. 
 * Other perfect numbers are 28, 496, and 8,128.
 * 
 * */

//this function returns true if number is perfect and false otherwise
bool perfect_number(int number) {
  if (number <= 1) return false;
  List<int> divisors = [];
  for (int i = 1; i < number; i++) {
    if (number % i == 0) divisors.add(i);
  }
  return divisors.reduce((a, b) => a + b) == number;
}

void main() {
  print(perfect_number(-1)); // false
  print(perfect_number(6)); // true
  print(perfect_number(12)); // false
  print(perfect_number(16)); // false
  print(perfect_number(26)); // false
  print(perfect_number(27)); // false
  print(perfect_number(28)); // true
}
