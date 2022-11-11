// Longest Common Substring Editorial: https://www.geeksforgeeks.org/longest-common-substring-dp-29/
//Longest Common Substring Wiki: https://en.wikipedia.org/wiki/Longest_common_substring_problem

import 'dart:math';
import 'package:test/test.dart';

int longestCommonSubstring(String text1, String text2) {
  int m = text1.length;
  int n = text2.length;

  // BottomUp Tabulation
  List<List<int>> dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));
  int ans = 0;
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (text1[i - 1] == text2[j - 1]) {
        dp[i][j] = 1 + dp[i - 1][j - 1];
        ans = max(ans, dp[i][j]);
      }
    }
  }
  return ans;
}

void main() {
  test(('testCase #1'), () {
    expect(longestCommonSubstring("", ""), equals(0));
  });

  test(('testCase #2'), () {
    expect(longestCommonSubstring("a", ""), equals(0));
  });
  test(('testCase #3'), () {
    expect(longestCommonSubstring("", "a"), equals(0));
  });
  test(('testCase #4'), () {
    expect(longestCommonSubstring("c", "c"), equals(1));
  });
  test(('testCase #5'), () {
    expect(longestCommonSubstring("abcdef", "bcd"), equals(3));
  });
  test(('testCase #6'), () {
    expect(longestCommonSubstring("abcdef", "xabded"), equals(2));
  });
  test(('testCase #7'), () {
    expect(longestCommonSubstring("GeeksforGeeks", "GeeksQuiz"), equals(5));
  });
  test(('testCase #8'), () {
    expect(longestCommonSubstring("abcdxyz", "xyzabcd"), equals(4));
  });
  test(('testCase #9'), () {
    expect(longestCommonSubstring("zxabcdezy", "yzabcdezx"), equals(6));
  });
  test(('testCase #10'), () {
    expect(
        longestCommonSubstring(
            "OldSite:GeeksforGeeks.org", "NewSite:GeeksQuiz.com"),
        equals(10));
  });
}
