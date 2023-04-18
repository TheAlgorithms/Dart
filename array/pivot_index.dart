import 'package:test/test.dart';

// Leetcode problem URL: https://leetcode.com/problems/find-pivot-index/
int sum(List<int> numbers) {
  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  return sum;
}

int pivotIndex(List<int> nums) {
  int leftSum = 0;
  int arraySum = sum(nums);

  for (int i = 0; i < nums.length; ++i) {
    if (leftSum == arraySum - leftSum - nums[i]) {
      return i;
    }
    leftSum += nums[i];
  }

  return -1;
}

void main() {
  test('test case 1', () => expect(pivotIndex([1, 7, 3, 6, 5, 6]), 3));
  test('test case 2', () => expect(pivotIndex([2, 1, -1]), 0));
  test('test case 3', () => expect(pivotIndex([1, 2, 3]), -1));
}
