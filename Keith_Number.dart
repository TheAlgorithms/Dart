import 'package:test/test.dart';
bool isKeith(int x)
  {
    List<int> terms = [];
    int temp = x;
    int n = 0;
    while (temp > 0) {
      terms.add(temp % 10);
      temp = (temp ~/ 10);
      n++;
    }
    terms = List.from(terms.reversed);
    //reverse(terms);
    int nextTerm = 0;
    int i = n;
    while (nextTerm < x) {
      nextTerm = 0;
      for (int j = 1; j <= n; j++) {
        nextTerm = (nextTerm + terms[i - j]);
      }
      terms.add(nextTerm);
      i++;
    }
    return nextTerm == x;
  }

  void main(List<String> args)
  {
   int n=742;

   test('test 1', () {
    n=14;
    expect(isKeith(n),true);
   });
   test('test 2', () {
     n=12879;
     expect(isKeith(n),false);
   });
   test('test 3', () {
     n=197;
     expect(isKeith(n),true);
   });
   test('test 4', () {
     n=742;
     expect(isKeith(n),true);
   });
  }
