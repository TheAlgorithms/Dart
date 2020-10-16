import 'package:test/test.dart';
import 'dart:math';

int kadanesAlgorithm(List<int> array) {
  int maxEndingHere = array[0];
  int maxSoFar = array[0];

  for (int num in array.sublist(1, array.length)) {
    maxEndingHere = max(maxEndingHere + num, num);
    maxSoFar = max(maxSoFar, maxEndingHere);
  }
  return maxSoFar;
}

void main() {
  List<int> array;
  int maxContiniousSubarraySum;

  test(('.Check the response for each test case'), () {
    array = [3, 5, -9, 1, 3, -2, 3, 4, 7, 2, -9, 6, 3, 1, -5, 4];

    maxContiniousSubarraySum = kadanesAlgorithm(array);
    expect(maxContiniousSubarraySum, equals(19));
  });

  test(('.Check the response for each test case'), () {
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    maxContiniousSubarraySum = kadanesAlgorithm(array);
    expect(maxContiniousSubarraySum, equals(55));
  });

  test(('.Check the response for each test case'), () {
    array = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10];
    maxContiniousSubarraySum = kadanesAlgorithm(array);
    expect(maxContiniousSubarraySum, equals(-1));
  });

  test(('.Check the response for each test case'), () {
    array = [1, 2, 3, 4, 5, 6, -22, 7, 8, 9, 10];
    maxContiniousSubarraySum = kadanesAlgorithm(array);
    expect(maxContiniousSubarraySum, equals(34));
  });
}
