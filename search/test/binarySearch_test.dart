import 'package:test/test.dart';

import '../binarySearch.dart';

void main() {
  group('Binary search ', () {
    const NOT_FOUND = -1;

    test('should work with an empty list', () {
      var index = binary_search([], 0, -1, 42);

      expect(index, NOT_FOUND);
    });

    test('should return -1 if element is not in list', () {
      var index = binary_search([23, 1337], 0, 1, 42);

      expect(index, NOT_FOUND);
    });

    test('should find a number on the left half of the array', () {
      var list = [0, 1, 2, 3, 4, 5, 6, 7];

      var index = binary_search(list, 0, 8, 1);

      expect(index, 1);
    });

    test('should find a number on the right half of the array', () {
      var list = [0, 1, 2, 3, 4, 5, 6, 7];

      var index = binary_search(list, 0, 8, 6);

      expect(index, 6);
    });

    test('should throw an ArgumentError if the passed list is not sorted', () {
      var list = [7, 6, 5, 4, 3, 2, 1, 0];

      expect(() => binary_search(list, 0, 8, 6), throwsArgumentError);
    });
  });
}
