import 'dart:math';
import 'package:test/test.dart';

int knapSackProblem(
int knapSackProblem(int capacity, List<int> values, List<int> weights,
    [int numberOfItems]) {
  numberOfItems ??= values.length;
  if (numberOfItems == 0 || capacity == 0) {
    return 0;
  }
  int currentValue = values[numberOfItems - 1];
  int currentWeight = weights[numberOfItems - 1];

  if (weights[numberOfItems - 1] <= capacity) {
    return max(
        currentValue +
            knapSackProblem(
                capacity - currentWeight, values, weights, numberOfItems - 1),
        knapSackProblem(capacity, values, weights, numberOfItems - 1));
  } else {
    return knapSackProblem(numberOfItems - 1, capacity, values, weights);
  }
}

void main() {
  int ans = knapSackProblem(4, 10, [1, 4, 5, 6], [2, 3, 6, 7]);
  print(ans);

  test('TC: 1', () {
    expect(knapSackProblem(4, 10, [1, 4, 5, 6], [2, 3, 6, 7]), 10);
  });

  ans = knapSackProblem(5, 100, [2, 70, 30, 69, 100], [1, 70, 30, 69, 100]);
  print(ans);

  test('TC: 2', () {
    expect(knapSackProblem(5, 100, [2, 70, 30, 69, 100], [1, 70, 30, 69, 100]),
        101);
  });
}
