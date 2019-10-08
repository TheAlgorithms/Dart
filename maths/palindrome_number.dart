/* Driver */
void main() {
  assert(isPalindrome(12321) == true);
  assert(isPalindrome(0) == true);
  assert(isPalindrome(1) == true);
  assert(isPalindrome(123322) == false);
}

/**
 * Return true if [n] is palindrome number, otherwise false
 * Throws [ArgumentError] if [n] is negative
 */
bool isPalindrome(int n) {
  if (n < 0) {
    throw new ArgumentError("$n is negative");
  }
  var copy = n;
  var reverseNumber = 0;
  while (n != 0) {
    reverseNumber = reverseNumber * 10 + n % 10;
    n = n ~/ 10;
  }

  return copy == reverseNumber;
}
