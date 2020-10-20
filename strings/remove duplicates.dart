import 'package:test/test.dart';

// function to remove duplicate in string
String removeDups(String s) {
  int j = 0;
  String l = '';
  int i = 0;
  var check = 0;
  for (i = 0; i < s.length; i++) {
    check = 0;
    var c = s[i];
    if (l.length != 0) {
      for (j = 0; j < l.length; j++) {
        if (c == l[j]) {
          check = 1;
          break;
        } else
          check = 0;
      }
      if (check == 0) l += c;
    } else
      l += c;
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
