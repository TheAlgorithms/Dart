/* Driver */
void main() {
  assert(isPalindrome("abcba"));
  assert(isPalindrome("a"));
  assert(isPalindrome(""));
  assert(isPalindrome("abbcba") == false);
}

/**
 * Return true if [string] is palindrome string, otherwise false
 */
bool isPalindrome(String string) {
  if (string.length <= 1) {
    return true;
  }

  for (int i = 0, limit = string.length ~/ 2; i <= limit; ++i) {
    if (string[i] != string[string.length - 1 - i]) {
      return false;
    }
  }
  return true;
}
