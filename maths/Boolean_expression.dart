import 'package:test/test.dart';

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
  test("Test singleton boolean remains same", () {
    expect(evaluateBoolExpr("1"), equals('1'));
    expect(evaluateBoolExpr("0"), equals('0'));
  });

  test("Test AND", () {
    expect(evaluateBoolExpr("1A1"), equals('1'));
    expect(evaluateBoolExpr("0A1"), equals('0'));
    expect(evaluateBoolExpr("1A0"), equals('0'));
    expect(evaluateBoolExpr("0A0"), equals('0'));
  });

  test("Test OR", () {
    expect(evaluateBoolExpr("1B1"), equals('1'));
    expect(evaluateBoolExpr("0B1"), equals('1'));
    expect(evaluateBoolExpr("1B0"), equals('1'));
    expect(evaluateBoolExpr("0B0"), equals('0'));
  });

  test("Test XOR", () {
    expect(evaluateBoolExpr("1C1"), equals('0'));
    expect(evaluateBoolExpr("0C1"), equals('1'));
    expect(evaluateBoolExpr("1C0"), equals('1'));
    expect(evaluateBoolExpr("0C0"), equals('0'));
  });

  test("Test '0B0B0B0B0B1'", () {
    expect(evaluateBoolExpr("0B0B0B0B0B1"), equals('1'));
  });

  test("Test '0B0B0B1A1'", () {
    expect(evaluateBoolExpr("0B0B0B1A1"), equals('1'));
  });
}
