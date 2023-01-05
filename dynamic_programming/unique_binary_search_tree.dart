import 'package:test/test.dart';

// Problem - https://leetcode.com/problems/unique-binary-search-trees/description/
// Given an integer n, return the number of structurally unique BST's (binary search trees)
// which has exactly n nodes of unique values from 1 to n.

class UniqueBST {
  int solve(int i, List<int> dp) {
    if (i == 0 || i == 1) return 1;
    if (dp[i] != -1) return dp[i];

    int total = 0;
    for (int k = 1; k <= i; k++) {
      total += solve(k - 1, dp) * solve(i - k, dp);
    }
    return dp[i] = total;
  }

  int numTrees(int n) {
    List<int> dp = List.filled(20, -1);
    return this.solve(n, dp);
  }
}

void main() {
  var uniqueBST = UniqueBST();
  test('Test Case 1: Input 3, Output - 5', () {
    expect(uniqueBST.numTrees(3), 5);
  });

  test('Test Case 2: Input 1, Output - 1', () {
    expect(uniqueBST.numTrees(1), 1);
  });
}
