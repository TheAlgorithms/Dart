import 'package:test/test.dart';

String reverseStringWords(String s) {
  String res = "";
  int m = s.length;
  int j = m - 1;
  for (int i = m - 1; i >= 0; i--) {
    if (s[i] == '.') {
      for (int j1 = i + 1; j1 <= j; j1++) {
        res += s[j1];
      }
      res += s[i];
      j = i - 1;
    } else if (i == 0) {
      for (int j1 = i; j1 <= j; j1++) {
        res += s[j1];
      }
    }
  }
  return res;
}

void main() {
  test("reverseStringWords single word returns same word", () {
    expect(reverseStringWords("word"), equals("word"));
  });

  test("reverseStringWords w1.w2 returns w2.w1", () {
    expect(reverseStringWords("w1.w2"), equals("w2.w1"));
  });

  test("reverseStringWords on empty string returns empty string", () {
    expect(reverseStringWords(""), equals(""));
  });

  test("reverseStringWords", () {
    expect(reverseStringWords("abhishek.is.a.good.boy"),
        equals("boy.good.a.is.abhishek"));
  });
}
