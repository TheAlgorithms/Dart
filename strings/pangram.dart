//https://www.geeksforgeeks.org/pangram-checking/
//Given a string check if it is Pangram or not. A pangram is a sentence containing every letter in the English Alphabet.
import 'package:test/test.dart';

bool isPanagram(String phrase)
{
  List<String> alphas = 'abcdefghijklmnopqrstuvwxyz'.split(''); // all alphabets
  var newPhrase = phrase
      .replaceAll(' ', '')
      .toLowerCase(); // remove spaces and take to lower case
  for (String alpha in alphas) {
    if (!newPhrase.contains(alpha)) return false;
  }
  return true;
}

void main() {
  String s = 'The quick brown fox jumps over the lazy dog';
  print(isPanagram(s));
  test('test 1', () {
    s = "";
    expect(isPanagram(s), false);
  });

  test('test 2', () {
    s = "this is a test case ";
    expect(isPanagram(s), false);
  });
  test('test 3', () {
    s = "The five boxing wizards jump quickly";
    expect(isPanagram(s), true);
  });
}