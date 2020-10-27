import 'package:test/test.dart';

int romanToInteger(var s) {
  int ans = 0;
  for (int i = 0; i < s.length; i++) {
    int num1 = value(s[i]);
    if (i + 1 < s.length) {
      int num2 = value(s[i + 1]);
      if (num1 < num2) {
        ans = ans + num2 - num1;
        i++;
      } else {
        ans = ans + num1;
      }
    } else {
      ans = ans + num1;
    }
  }
  return ans;
}

int value(var r) {
  if (r == 'I')
    return 1;
  else if (r == 'V')
    return 5;
  else if (r == 'X')
    return 10;
  else if (r == 'L')
    return 50;
  else if (r == 'C')
    return 100;
  else if (r == 'D')
    return 500;
  else if (r == 'M') return 1000;
  return 0;
}

void main() {
  test("romanToInteger XII returns 12", () {
    expect(romanToInteger('XII'), equals(12));
  });

  test("romanToInteger LII returns 52", () {
    expect(romanToInteger('LII'), equals(52));
  });

  test("romanToInteger DLVII returns 557", () {
    expect(romanToInteger('LII'), equals(52));
  });

  test("romanToInteger VI returns 6", () {
    expect(romanToInteger('VI'), equals(6));
  });

  test("romanToInteger CLXV returns 165", () {
    expect(romanToInteger('CLXV'), equals(165));
  });

  test("romanToInteger MDCI returns 1601", () {
    expect(romanToInteger('MDCI'), equals(1601));
  });

  test("romanToInteger LVII returns 57", () {
    expect(romanToInteger('LVII'), equals(57));
  });
}
