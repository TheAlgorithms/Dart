import 'package:test/test.dart';

// function to remove duplicate in string
String removeDups(String s) {
  var arr = new List.filled(256, 0);
  String l = '';
  int i = 0;
  for (i = 0; i < s.length; i++) {
    if (arr[s.codeUnitAt(i)] == 0) {
      l += s[i];
      arr[s.codeUnitAt(i)]++;
    }
  }
  return l;
}

void main() {
  test("removeDups from string without duplicates returns same string", () {
    expect(removeDups("1234"), equals("1234"));
  });

  test("removeDups from empty list returns empty list", () {
    expect(removeDups(""), equals(""));
  });

  test("removeDups from 12341234 returns 1234", () {
    expect(removeDups("12341234"), equals("1234"));
  });

  test("removeDups from aaaab returns ab", () {
    expect(removeDups("aaaab"), equals("ab"));
  });
}
