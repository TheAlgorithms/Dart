//radix sort
/*
 radix sort is a non-comparative sorting algorithm. It avoids comparison by creating and distributing elements into buckets according to their radix.
  For elements with more than one significant digit, this bucketing process is repeated for each digit, 
 while preserving the ordering of the prior step, until all digits have been considered. For this reason, 
 radix sort has also been called bucket sort and digital sort.
 */
import 'dart:math' as Math;

main() {
  // print(radixSort([]));
  var radixsort = radixSort([34, 2, 122, 24435, 23, 434, 232, 1323]);
  print(radixsort);
}

getDigitNum(int n, int i) {

  var cal = (n.round().abs() / Math.pow(10, i)) % 10;

  return cal.round();
}

digitCount(int number) {
  if (number == 0) {
    return 1;
  }
  return (number.abs().toString().length);
}

mostDigits(List number) {
  var maxDigits = 0;
  for (var i = 0; i < number.length; i++) {
    maxDigits = Math.max(maxDigits, digitCount(number[i]));
  }
  return maxDigits;
}

radixSort(List nums) {
  var maxDightCount = mostDigits(nums);
  for (var k = 0; k < maxDightCount; k++) {
    var digitBuckets = List.generate(10, (_) => []);
    // print(digitBuckets);
    for (var i = 0; i < nums.length; i++) {
      var digit = getDigitNum(nums[i], k);
      digitBuckets[digit].add(nums[i]);
    }

    nums = digitBuckets.expand((lst) => lst).toList();
  }
  return nums;
}
