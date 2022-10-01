import 'package:test/test.dart';

import '../strings/truncate_string.dart';

void main() {
  test(
    "Truncate a long string given the max number of words and or suffix",
    () {
      String stringToTruncate =
          "The beautiful thing with learning is that no one can take it away from you";
      expect(truncateString(stringToTruncate, maxNumberOfWords: 40),
          equals("The beautiful thing with learning is..."));
    },
  );
}
