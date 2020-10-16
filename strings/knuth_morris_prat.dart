import 'package:test/test.dart';

bool stringCompare(String string, String subString) {
  List<int> pattern =
      new List<int>.generate(subString.length, (int index) => -1);

  int i = 1;
  int j = 0;

  while (i < subString.length) {
    if (subString[i] == subString[j]) {
      pattern[i] = j;
      i++;
      j++;
    } else if (j > 0) {
      j = pattern[j - 1] + 1;
    } else {
      i++;
    }
  }

  return stringCompareHelper(string, subString, pattern);
}

bool stringCompareHelper(String string, String subString, List<int> pattern) {
  int i = 0;
  int j = 0;

  while (i + subString.length - j <= string.length) {
    if (string[i] == subString[j]) {
      if (j == subString.length - 1) {
        return true;
      }
      i++;
      j++;
    } else if (j > 0) {
      j = pattern[j - 1] + 1;
    } else {
      i++;
    }
  }
  return false;
}

void main() {
  String string;
  String subString;

  test(('KMP: '), () {
    string = 'aefoaefcdaefcdaed';
    subString = 'aefcdaed';
    expect(stringCompare(string, subString), equals(true));
  });

  test(('KMP: '), () {
    string = 'testwafwafawfawfawfawfawfawfawfa';
    subString = 'fawfawfawfawfa';
    expect(stringCompare(string, subString), equals(true));
  });

  test(('KMP: '), () {
    string = 'aabc';
    subString = 'abc';
    expect(stringCompare(string, subString), equals(true));
  });

  test(('KMP: '), () {
    string = 'adafccfefbbbfeeccbcfd';
    subString = 'ecb';
    expect(stringCompare(string, subString), equals(false));
  });

  test(('KMP: '), () {
    string = 'akash';
    subString = 'christy';
    expect(stringCompare(string, subString), equals(false));
  });
}
