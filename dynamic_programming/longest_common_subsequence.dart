// Longest Common Subsequence Editorial: https://www.geeksforgeeks.org/longest-common-subsequence-dp-4/
//Longest Common Subsequence Wiki: https://en.wikipedia.org/wiki/Longest_common_subsequence_problem
import 'dart:math';
import 'package:test/test.dart';

int longestCommonSubsequence(String text1, String text2) {
  int m = text1.length;
  int n = text2.length;

  // BottomUp Tabulation
  List<List<int>> dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (text1[i - 1] == text2[j - 1]) {
        dp[i][j] = 1 + dp[i - 1][j - 1];
        continue;
      }
      dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
    }
  }
  return dp[m][n];
}

void main() {
  test(('testCase #1'), () {
    expect(longestCommonSubsequence("", ""), equals(0));
  });

  test(('testCase #2'), () {
    expect(longestCommonSubsequence("", "abcd"), equals(0));
  });
  test(('testCase #3'), () {
    expect(longestCommonSubsequence("abcd", ""), equals(0));
  });
  test(('testCase #4'), () {
    expect(longestCommonSubsequence("abcd", "c"), equals(1));
  });
  test(('testCase #5'), () {
    expect(longestCommonSubsequence("abcd", "d"), equals(1));
  });
  test(('testCase #6'), () {
    expect(longestCommonSubsequence("abcd", "e"), equals(0));
  });
  test(('testCase #7'), () {
    expect(longestCommonSubsequence("abcdefghi", "acegi"), equals(5));
  });
  test(('testCase #8'), () {
    expect(longestCommonSubsequence("abcdgh", "aedfhr"), equals(3));
  });
  test(('testCase #9'), () {
    expect(longestCommonSubsequence("aggtab", "gxtxayb"), equals(4));
  });
  test(('testCase #10'), () {
    expect(longestCommonSubsequence("ggg", "g"), equals(1));
  });
}
