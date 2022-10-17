import 'dart:math';
import 'package:test/test.dart';

// Prints the length of the longest common subsequence
int longest_common_subsequence(String t1, String t2) {
  int m = t1.length;
  int n = t2.length;

  // BottomUp Tabulation
  List<List<int>> dp = List<List<int>>.filled(
      m + 1, List<int>.filled(n + 1, 0, growable: false),
      growable: false);

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      // if (i == 0 || j == 0) {
      //   dp[i][j] = 0;
      //   continue;
      // }
      if (t1[i - 1] == t2[j - 1]) {
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
    expect(longest_common_subsequence("", ""), equals(0));
  });

  test(('testCase #2'), () {
    expect(longest_common_subsequence("", "abcd"), equals(0));
  });
  test(('testCase #3'), () {
    expect(longest_common_subsequence("abcd", ""), equals(0));
  });
  test(('testCase #4'), () {
    expect(longest_common_subsequence("abcd", "c"), equals(1));
  });
  test(('testCase #5'), () {
    expect(longest_common_subsequence("abcd", "d"), equals(1));
  });
  test(('testCase #6'), () {
    expect(longest_common_subsequence("abcd", "e"), equals(0));
  });
  test(('testCase #7'), () {
    expect(longest_common_subsequence("abcdefghi", "acegi"), equals(5));
  });
  test(('testCase #8'), () {
    expect(longest_common_subsequence("abcdgh", "aedfhr"), equals(3));
  });
  test(('testCase #9'), () {
    expect(longest_common_subsequence("aggtab", "gxtxayb"), equals(4));
  });
  test(('testCase #10'), () {
    expect(longest_common_subsequence("ggg", "g"), equals(1));
  });
}
