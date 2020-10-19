String reverseStringWords(String s) {
  String res = "";
  int m = s.length;
  int j = m - 1;
  for (int i = m - 1; i >= 0; i--) {
    if (s[i] == '.') {
      for (int j1 = i + 1; j1 <= j; j1++) {
        res += s[j1];
      }
      res += s[i];
      j = i - 1;
    } else if (i == 0) {
      for (int j1 = i; j1 <= j; j1++) {
        res += s[j1];
      }
    }
  }
  return res;
}

void main() {
  String s = "abhishek.is.a.good.boy";
  print(reverseStringWords(s));
}
