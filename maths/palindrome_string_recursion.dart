/* Driver */
void main() {
  assert(isPalindrome("abcba", 0, 4));
  assert(isPalindrome("a", 0, 0));
  assert(isPalindrome("abbcba", 0, 5) == false);
}

/**
 * Return true if [string] is palindrome string, otherwise false
 */
bool isPalindrome(String string, int low, int high) {
  if (low == high) {
    return true;
  } else if (string[low] != string[high]) {
    return false;
  } else {
    return isPalindrome(string, low + 1, high - 1);
  }
}
