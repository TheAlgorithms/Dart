String evaluateBoolExpr(String s) {
  int n = s.length;
  // Traverse all operands by jumping
  // a character after every iteration.
  for (int i = 0; i < n - 2; i += 2) {
    // If operator next to current operand
    // is AND.
    if (s[i + 1] == 'A') {
      if (s[i + 2] == '0' || s[i] == '0')
        s.replaceRange(i + 2, i + 3, '0');
      else
        s.replaceRange(i + 2, i + 3, '1');
    }

    // If operator next to current operand
    // is OR.
    else if (s[i + 1] == 'B') {
      if (s[i + 2] == '1' || s[i] == '1')
        s.replaceRange(i + 2, i + 3, '1');
      else
        s.replaceRange(i + 2, i + 3, '0');
    }

    // If operator next to current operand
    // is XOR (Assuming a valid input)
    else {
      if (s[i + 2] == s[i])
        s.replaceRange(i + 2, i + 3, '0');
      else
        s.replaceRange(i + 2, i + 3, '1');
    }
  }
  return s.substring(n - 1, n);
}

// Driver code
void main() {
  String s = "1A0B1";
  print(evaluateBoolExpr(s));
}
