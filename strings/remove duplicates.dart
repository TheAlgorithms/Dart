// function to remove duplicate in string
String removeDups(String s) {
  int j = 0;
  String l = '';
  int i = 0;
  var check = 0;
  for (i = 0; i < s.length; i++) {
    check = 0;
    var c = s[i];
    if (l.length != 0) {
      for (j = 0; j < l.length; j++) {
        if (c == l[j]) {
          check = 1;
          break;
        } else
          check = 0;
      }
      if (check == 0) l += c;
    } else
      l += c;
  }
  return l;
}

void main() {
  String s = "dsasadshadjhs";
  print(removeDups(s));
}
