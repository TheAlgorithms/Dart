import 'package:test/test.dart';

List<int> moveZeroes(List<int> nums) {
  int lastNonZeroFoundAt = 0;

  for (int i = 0; i < nums.length; ++i) {
    if (nums[i] != 0) {
      nums[lastNonZeroFoundAt] = nums[i];
      lastNonZeroFoundAt += 1;
    }
  }

  for (int i = lastNonZeroFoundAt; i < nums.length; ++i) {
    nums[i] = 0;
  }
  return nums;
}

void main() {
  test('test case 1', () {
    return expect(moveZeroes([1, 0, 2, 0, 0]), [1, 2, 0, 0, 0]);
  });
  test('test case 2', () {
    return expect(moveZeroes([1, 2, 2, 3, 5]), [1, 2, 2, 3, 5]);
  });
  test('test case 3', () {
    return expect(moveZeroes([0, 0, 0, 0, 0]), [0, 0, 0, 0, 0]);
  });
  test('test case 4', () {
    return expect(moveZeroes([]), []);
  });
}
