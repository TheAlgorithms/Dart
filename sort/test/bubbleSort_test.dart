import 'package:test/test.dart';

import '../bubbleSort.dart';
import 'utils.dart';

void main() {
  group('Bubble sort', () {
    test('shoud sort an empty list', () {
      var emptyList = new List<int>();

      bubbleSort(emptyList);

      expect(isSorted(emptyList), isTrue);
    });

    test('should sort an already sorted list', () {
      var listToSort = [1, 2, 3, 4, 23, 42];

      bubbleSort(listToSort);

      expect(isSorted(listToSort), isTrue);
    });

    test('should sort an unsorted list', () {
      var listToSort = [23, 42, 1, 10, 5];

      bubbleSort(listToSort);

      expect(isSorted(listToSort), isTrue);
    });

    test('should sort an unsorted list with negative numbers', () {
      var listToSort = [23, -42, 1, 10, -5];

      bubbleSort(listToSort);

      expect(isSorted(listToSort), isTrue);
    });
  });
}
