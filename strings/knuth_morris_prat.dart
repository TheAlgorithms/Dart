import 'package:test/test.dart';

/// Preprocess pattern to identify any suffixes that are identical to prefixes
/// in the given string.
///
/// Build a pattern which tells us where to continue iteration from if we
///  get a mismatch between the character
///
/// Step through the text one character at a time and compare it to a character in
/// the pattern updating our location within the pattern if necessary
bool stringCompare(String string, String subString) {
  if (subString.isEmpty) {
    return false;
  }

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
    expect(stringCompare(string, subString), isTrue);
  });

  test(('KMP: '), () {
    string = 'testwafwafawfawfawfawfawfawfawfa';
    subString = 'fawfawfawfawfa';
    expect(stringCompare(string, subString), isTrue);
  });

  test(('KMP: '), () {
    string = 'aabc';
    subString = 'abc';
    expect(stringCompare(string, subString), isTrue);
  });

  test(('KMP: '), () {
    string = 'adafccfefbbbfeeccbcfd';
    subString = 'ecb';
    expect(stringCompare(string, subString), isFalse);
  });

  test(('KMP: '), () {
    string = 'akash';
    subString = 'christy';
    expect(stringCompare(string, subString), isFalse);
  });
  test(('KMP: '), () {
    string = '';
    subString = 'asd';
    expect(stringCompare(string, subString), isFalse);
  });

  test(('KMP: '), () {
    string = 'asd';
    subString = '';
    expect(stringCompare(string, subString), isFalse);
  });
}
