import 'dart:math';

int kadanesAlgorithm(List<int> array) {
  int maxEndingHere = array[0];
  int maxSoFar = array[0];

  for (int num in array.sublist(1, array.length)) {
    maxEndingHere = [maxEndingHere + num , num ].reduce(max);
    maxSoFar = [maxSoFar, maxEndingHere].reduce(max);
  }
  return maxSoFar;
}

void main() {
  List<int> array = [3, 5, -9, 1, 3, -2, 3, 4, 7, 2, -9, 6, 3, 1, -5, 4];
  int maxContiniousSubarraySum;
  maxContiniousSubarraySum = kadanesAlgorithm(array);
  print('${maxContiniousSubarraySum == 19}');
  
  
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  maxContiniousSubarraySum;
  maxContiniousSubarraySum = kadanesAlgorithm(array);
  print('${maxContiniousSubarraySum == 55}');
  
  
  array = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10];
  maxContiniousSubarraySum;
  maxContiniousSubarraySum = kadanesAlgorithm(array);
  print('${maxContiniousSubarraySum == -1}');
  
  
  array = [1, 2, 3, 4, 5, 6, -22, 7, 8, 9, 10];
   maxContiniousSubarraySum;
  maxContiniousSubarraySum = kadanesAlgorithm(array);
  print('${maxContiniousSubarraySum == 34}');
}
