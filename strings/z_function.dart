import 'package:test/test.dart';

/*
The z function of a string S with size n returns an array Z, where Z[i] is the largest size
of a substring that starts at index i and matches the prefix of the string S.
Obs: Z[0] is always 0.

Example:

  string S: "abcabcabc"
  array Z: [0, 0, 0, 3, 0, 0, 6, 0, 0]

  string S: "aaaa"
  array Z: [0, 3, 2, 1]

Complexity: linear in the length of the string - O(n)
Source: https://cp-algorithms.com/string/z-function.html
*/

import 'dart:math';

List<int> zFunction(String s) {
  final z = List.filled(s.length, 0);
  int l = 0;
  int r = 0;

  // The first element must be 0, so the loop starts at index 1.
  for (int i = 1; i < s.length; i++) {
    if (i < r) {
      z[i] = min(r - i, z[i - l]);
    }
    // Calculate the quantity of chars in common from string and substring prefix
    while (i + z[i] < s.length && s[z[i]] == s[i + z[i]]) {
      z[i]++;
    }
    if (i + z[i] > r) {
      l = i;
      r = i + z[i];
    }
  }
  return z;
}

void main() {
  String string;
  List<int> z;

  test(('zFunction: '), () {
    string = 'abcabcabc';
    z = [0, 0, 0, 3, 0, 0, 6, 0, 0];
    expect(zFunction(string), z);
  });

  test(('zFunction: '), () {
    string = 'aaaa';
    z = [0, 3, 2, 1];
    expect(zFunction(string), z);
  });
}
