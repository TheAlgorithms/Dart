/* 
 * https://en.wikipedia.org/wiki/Amicable_numbers
 *
 *Amicable numbers are two different numbers related in such a way that the sum of the proper divisors of each is equal to the other number.
 * 
 * */

//this function returns true if numbers are amicable and false otherwise
bool amicable_number(int firstNumber, int secondNumber) {
  if (firstNumber <= 1 || secondNumber <= 1) return false;
  List<int> firstNumberProperDivisors = [];
  List<int> secondNumberProperDivisors = [];
  for (int i = 1; i < firstNumber; i++) {
    if (firstNumber % i == 0) firstNumberProperDivisors.add(i);
  }
  for (int i = 1; i < secondNumber; i++) {
    if (secondNumber % i == 0) secondNumberProperDivisors.add(i);
  }
  return firstNumber == secondNumberProperDivisors.reduce((a, b) => a + b) &&
      secondNumber == firstNumberProperDivisors.reduce((a, b) => a + b);
}

void main() {
  print(amicable_number(12, 14)); // false
  print(amicable_number(220, 284)); // true
  print(amicable_number(60, 84)); // true
  print(amicable_number(1184, 1210)); //true
  print(amicable_number(-14, 10)); //false
}
