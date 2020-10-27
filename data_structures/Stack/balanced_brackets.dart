import 'package:test/test.dart';
import 'package:stack/stack.dart';

bool isBalancedBrackets(String string) {
  Stack<String> stack = Stack();

  List<String> openingBrackets = ['(', '{', '['];
  final Map<String, String> matchingBracket = {'}': '{', ')': '(', ']': '['};

  for (int i = 0; i < string.length; i++) {
    var currentChar = string[i];

    if (openingBrackets.contains(currentChar)) {
      stack.push(currentChar);
    } else {
      if (stack.isNotEmpty) {
        if (stack.top() == matchingBracket[currentChar]) {
          stack.pop();
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

void main() {
  test(('Balanced Bracket'), () {
    expect(isBalancedBrackets('([])(){}(())()()'), isTrue);
  });

  test(('Balanced Bracket'), () {
    expect(isBalancedBrackets('()[]{}{'), isFalse);
  });

  test(('Balanced Bracket'), () {
    expect(isBalancedBrackets('()()[{()})]'), isFalse);
  });

  test(('Balanced Bracket'), () {
    expect(isBalancedBrackets('()([])'), isTrue);
  });

  test(('Balanced Bracket'), () {
    expect(
        isBalancedBrackets(
            '(((((([[[[[[{{{{{{{{{{{{()}}}}}}}}}}}}]]]]]]))))))((([])({})[])[])[]([]){}(())'),
        isTrue);
  });
}
