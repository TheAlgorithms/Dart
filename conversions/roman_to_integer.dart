int romanToInteger(var s) {
  int ans = 0;
  for (int i = 0; i < s.length; i++) {
    int num1 = value(s[i]);
    if (i + 1 < s.length) {
      int num2 = value(s[i + 1]);
      if (num1 < num2) {
        ans = ans + num2 - num1;
        i++;
      } else {
        ans = ans + num1;
      }
    } else {
      ans = ans + num1;
    }
  }
  return ans;
}

int value(var r) {
  if (r == 'I')
    return 1;
  else if (r == 'V')
    return 5;
  else if (r == 'X')
    return 10;
  else if (r == 'L')
    return 50;
  else if (r == 'C')
    return 100;
  else if (r == 'D')
    return 500;
  else if (r == 'M') return 1000;
  return 0;
}

void main() {
  String s = 'XII';
  print(romanToInteger(s));
  s = 'LII';
  print(romanToInteger(s));
  s = 'DLVII';
  print(romanToInteger(s));
  s = 'VI';
  print(romanToInteger(s));
  s = 'CLXV';
  print(romanToInteger(s));
  s = 'MDCI';
  print(romanToInteger(s));
  s = 'LVII';
  print(romanToInteger(s));
}
