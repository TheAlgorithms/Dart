// Leetcode problem: https://leetcode.com/problems/car-pooling/
// Solution Explanation: https://leetcode.com/problems/car-pooling/solutions/3252690/dart-time-o-n-o-1-space-solution/

import 'dart:math';
import "package:test/test.dart";

bool carPooling(List<List<int>> trips, int capacity) {
  List<int> passengerTimelineCount = List.filled(1001, 0);
  int lastPoint = 0;

  for (List<int> trip in trips) {
    int count = trip[0];
    int from = trip[1];
    int to = trip[2];
    if (count > capacity) {
      return false;
    }

    lastPoint = max(lastPoint, to);
    passengerTimelineCount[from] += count;
    passengerTimelineCount[to] -= count;
  }

  for (int i = 1; i < lastPoint; ++i) {
    passengerTimelineCount[i] += passengerTimelineCount[i - 1];
    if (passengerTimelineCount[i] > capacity) {
      return false;
    }
  }
  return true;
}

void main() {
  List<List<int>> trips = [
    [2, 1, 5],
    [3, 3, 7]
  ];

  List<List<int>> trips1 = [
    [2, 1, 5],
    [3, 5, 7]
  ];

  List<List<int>> trips2 = [
    [2, 2, 6],
    [2, 4, 7],
    [8, 6, 7]
  ];

  List<List<int>> trips3 = [
    [7, 5, 6],
    [6, 7, 8],
    [10, 1, 6]
  ];

  test('test case 1', () => expect(carPooling(trips, 4), false));
  test('test case 2', () => expect(carPooling(trips, 5), true));
  test('test case 3', () => expect(carPooling(trips1, 3), true));
  test('test case 4', () => expect(carPooling(trips2, 11), true));
  test('test case 5', () => expect(carPooling(trips3, 16), false));
}
