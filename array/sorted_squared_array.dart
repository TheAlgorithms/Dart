import 'package:test/test.dart';

List<int> sortedSquaredArray(List<int> array) {
  int start = 0;
  int end = array.length - 1;
  int sortedIndex = array.length - 1;
  List<int> answer = List.filled(array.length, 0);

  while (end >= start) {
    if (array[start].abs() > array[end].abs()) {
      answer[sortedIndex] = array[start] * array[start];
      start += 1;
    } else {
      answer[sortedIndex] = array[end] * array[end];
      end -= 1;
    }
    sortedIndex -= 1;
  }

  return answer;
}

void main() {
  test('test case 1', () {
    expect(sortedSquaredArray([-1, -1, 2, 3, 3, 3, 4]), [1, 1, 4, 9, 9, 9, 16]);
  });

  test('test case 2', () {
    expect(sortedSquaredArray([0]), [0]);
  });

  test('test case 2', () {
    expect(sortedSquaredArray([-7, -6, -5, -4, -3, -2, -1]),
        [1, 4, 9, 16, 25, 36, 49]);
  });

  test('test case 4', () {
    expect(
        sortedSquaredArray([1, 2, 3, 4, 5, 6, 7]), [1, 4, 9, 16, 25, 36, 49]);
  });
}
