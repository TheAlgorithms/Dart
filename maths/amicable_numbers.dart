/* 
 * https://en.wikipedia.org/wiki/Amicable_numbers
 *
 *Amicable numbers are two different numbers related in such a way that the sum of the proper divisors of each is equal to the other number.
 * 
 * */

//this function returns true if numbers are amicable and false otherwise
bool amicable_number(int first_number, int second_number) {
  if (first_number <= 1 || second_number <= 1) return false;
  List<int> first_number_proper_divisors = [];
  List<int> second_number_proper_divisors = [];
  for (int i = 1; i < first_number; i++) {
    if (first_number % i == 0) first_number_proper_divisors.add(i);
  }
  for (int i = 1; i < second_number; i++) {
    if (second_number % i == 0) second_number_proper_divisors.add(i);
  }
  return first_number ==
          second_number_proper_divisors.reduce((a, b) => a + b) &&
      second_number == first_number_proper_divisors.reduce((a, b) => a + b);
}

void main() {
  print(amicable_number(12, 14)); // false
  print(amicable_number(220, 284)); // true
  print(amicable_number(60, 84)); // true
  print(amicable_number(1184, 1210)); //true
  print(amicable_number(-14, 10)); //false
}
