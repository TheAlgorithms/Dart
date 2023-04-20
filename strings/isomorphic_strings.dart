import 'package:test/test.dart';

// Leetcode problem url: https://leetcode.com/problems/isomorphic-strings/
bool isIsomorphic(String string1, String string2) {
  Map<String, String> sMap = {};
  Map<String, String> tMap = {};

  for (int i = 0; i < string1.length; ++i) {
    String s = string1[i];
    String c = string2[i];

    // Both characters are not mapped so far.
    if (!sMap.containsKey(s) && !tMap.containsKey(c)) {
      sMap[s] = c;
      tMap[c] = s;
    }
    // One of the characters is mapped.
    else if (!sMap.containsKey(s) || !tMap.containsKey(c)) {
      return false;
    }
    // Both characters are mapped
    else if (sMap[s] != c || tMap[c] != s) {
      return false;
    }
  }
  return true;
}

void main() {
  test('test case 1', () => expect(isIsomorphic('egg', 'add'), true));
  test('test case 2', () => expect(isIsomorphic('foo', 'bar'), false));
  test('test case 3', () => expect(isIsomorphic('paper', 'title'), true));
}
