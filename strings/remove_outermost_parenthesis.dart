class Solution {
  String removeOuterParentheses(String s) {
    int cnt = 0;
    StringBuffer res = StringBuffer();

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(' && cnt == 0) {
        cnt++;
      } else if (s[i] == '(' && cnt >= 1) {
        res.write(s[i]);
        cnt++;
      } else if (s[i] == ')' && cnt > 1) {
        res.write(s[i]);
        cnt--;
      } else if (s[i] == ')' && cnt == 1) {
        cnt--;
      }
    }

    return res.toString();
  }
}

void main() {
  Solution solution = Solution();

  // Test case
  String input = "(()())(())";
  String result = solution.removeOuterParentheses(input);

  print("Input: $input");
  print("Output: $result");
}
