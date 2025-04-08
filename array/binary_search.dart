import 'package:test/test.dart';


int bin_search(List<int> numbers, int tar) {
  int l = 0, r = numbers.length - 1;

  while (l <= r) {
    int mid = (l + r) ~/ 2;

    if (numbers[mid] == tar) {
      return mid;
    } else if (numbers[mid] < tar) {
      l = mid + 1;
    } else {
      r = mid - 1;
    }
  }

  return -1; // Not found
}


void main() {
  test('test 1 - found', () {
    expect(bin_search([1, 2, 3, 4], 3), 2);
  });

  test('test 2 - not found', () {
    expect(bin_search([1, 2, 3, 4, 7], 12), -1);
  });
}
