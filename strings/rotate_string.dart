// leetcode problem : https://leetcode.com/problems/rotate-string

class Solution {
  bool rotateString(String s, String goal) {
    int m = s.length;
    int n = goal.length;

    if (m != n) return false;

    for (int i = 0; i < m; i++) {
      s = s.substring(1) + s[0];
      if (s == goal) return true;
    }
    return false;
  }
}

void main() {
  Solution solution = Solution();

  // Test case
  String s = "abcde";
  String goal = "cdeab";

  bool result = solution.rotateString(s, goal);

  print("Input:");
  print("s = \"$s\"");
  print("goal = \"$goal\"");
  print("Output: $result");
}
