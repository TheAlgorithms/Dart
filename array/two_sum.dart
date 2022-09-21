import 'package:test/test.dart';

bool twoSum(List<int> nums, int target) {
  Map<int, int> seen = {};
  for (int index = 0; index < nums.length; ++index) {
    int number = nums[index];

    int complement = target - number;
    if (seen.containsKey(complement)) {
      return true;
    } else {
      seen[number] = index;
    }
  }
  return false;
}

void main() {
  test('test 1', () {
    expect(twoSum([1, 2, 3, 4], 7), isTrue);
  });

  test('test 2', () {
    expect(twoSum([1, 2, 3, 4], 12), isFalse);
  });
}
