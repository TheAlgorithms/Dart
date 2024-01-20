import 'package:test/test.dart';

String truncateString(String string,
    {int maxNumberOfWords, String suffix = '...'}) {
  return (string.length - 3) < maxNumberOfWords
      ? "$string$suffix"
      : '${string.substring(0, string.substring(0, maxNumberOfWords - suffix.length).lastIndexOf(" "))}$suffix';
}

void main() {
  test(
    "Truncate a long string given the max number of words and or suffix",
    () {
      String stringToTruncate =
          "The beautiful thing with learning is that no one can take it away from you";
      expect(truncateString(stringToTruncate, maxNumberOfWords: 40),
          equals("The beautiful thing with learning is..."));
    },
  ); //pass

  test(
    "Open source is Awsome",
    () {
      String stringToTruncate = "Open source is Awsome";
      expect(truncateString(stringToTruncate, maxNumberOfWords: 15),
          equals("Open source..."));
    },
  ); // pass
  test(
    "The Dart Programming Language is cool",
    () {
      String stringToTruncate = "The Dart Programming Language";
      expect(truncateString(stringToTruncate, maxNumberOfWords: 10),
          equals("The Dart..."));
    },
  ); // fails
}
