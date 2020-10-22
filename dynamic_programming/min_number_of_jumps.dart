import 'dart:math';
import 'package:test/test.dart';

int minimumNumberOfJumps(List<int> array) {
  List<int> jumps = List.generate((array.length), (index) => 1000000000000);
  jumps[0] = 0;
  int length = array.length;
  for (int i = 1; i < length; i++) {
    for (int j = 0; j < i; j++) {
      if (array[j] + j >= i) {
        jumps[i] = min(jumps[j] + 1, jumps[i]);
      }
    }
  }
  return jumps[length - 1];
}

void main() {
  List<int> array;
  test('test 1', () {
    array = [3, 4, 2, 1, 2, 3, 7, 1, 1, 1, 3];
    expect(minimumNumberOfJumps(array), 4);
  });
  test('test 2', () {
    array = [1];
    expect(minimumNumberOfJumps(array), 0);
  });
  test('test 3', () {
    array = [1, 1];
    expect(minimumNumberOfJumps(array), 1);
  });
  test('test 4', () {
    array = [1, 1, 1];
    expect(minimumNumberOfJumps(array), 2);
  });
  test('test 5', () {
    array = [2, 1, 2, 3, 1, 1, 1];
    expect(minimumNumberOfJumps(array), 3);
  });
  test('test 6', () {
    array = [3, 4, 2, 1, 2, 3, 7, 1, 1, 1, 3, 2, 3, 2, 1, 1, 1, 1];
    expect(minimumNumberOfJumps(array), 7);
  });
}
