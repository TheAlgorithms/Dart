import 'package:test/test.dart';

void main() {
  palindrome();
}

void palindrome() {
  print('Enter Words or number');
  // User enter a string or a number
  String original = 'hannah';

  // then we will reverse the input
  String reverseUsingLoop = reverseStringUsingLoop(original);
  String reverseUsingSplit = reverseStringUsingSplit(original);
  String reverseUsingRunes = reverseStringUsingRunes(original);
  String reverseUsingCodeUnits = reverseStringUsingCodeUnits(original);

  // then we will compare (Use any one of the four)
  if (original == reverseUsingLoop) {
    // print('Its A Palindrome');
  } else {
    // print('Its A Not Palindrome');
  }

  if (original == reverseUsingSplit) {
    // print('Its A Palindrome');
  } else {
    // print('Its A Not Palindrome');
  }

  if (original == reverseUsingRunes) {
    // print('Its A Palindrome');
  } else {
    // print('Its A Not Palindrome');
  }

  if (original == reverseUsingCodeUnits) {
    // print('Its A Palindrome');
  } else {
    // print('Its A Not Palindrome');
  }

  // test
  group('Palindrome Check', () {
    test('Using loop to reverse a string.', () {
      var string = 'hannah';
      expect(string, equals(reverseStringUsingLoop(string)));
    });
    test('Using split to reverse a string.', () {
      var string = 'hannah';
      expect(string, equals(reverseStringUsingSplit(string)));
    });
    test('Using runes to reverse a string.', () {
      var string = 'hannah';
      expect(string, equals(reverseStringUsingRunes(string)));
    });
    test('Using code units to reverse a string.', () {
      var string = 'hannah';
      expect(string, equals(reverseStringUsingCodeUnits(string)));
    });
  });
}

String reverseStringUsingLoop(String input) {
  String reversed = "";
  for (int index = input.length - 1; index >= 0; index--) {
    reversed += input[index];
  }
  return reversed;
}

String reverseStringUsingSplit(String input) {
  var chars = input.split('');
  return chars.reversed.join();
}

String reverseStringUsingRunes(String input) {
  var chars = input.runes.toList();

  return String.fromCharCodes(chars.reversed);
}

String reverseStringUsingCodeUnits(String input) {
  return String.fromCharCodes(input.codeUnits.reversed);
}
