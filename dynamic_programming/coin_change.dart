import 'dart:math';
import 'package:test/test.dart';

/// we build an array which calculates the min coins for all amounts upto n
///
///  bottom up approach where we calculate the number of coins used for each
///  amount from 1 to n for each coin.
///  time complexity O(targetAmount * coinDenoms)
///  space complexity O(targetAmount)
int minNumberOfCoins(int targetAmount, List<int> coinDenoms) {
  List<int> amounts =
      new List<int>.generate(targetAmount + 1, (int index) => 1000000000000);

  amounts[0] = 0;

  for (int currentCoin in coinDenoms) {
    for (int amount = currentCoin; amount <= targetAmount; amount++) {
      amounts[amount] = min(amounts[amount], amounts[amount - currentCoin] + 1);
    }
  }
  if (amounts[targetAmount] != 1000000000000) {
    return amounts[targetAmount];
  }
  return -1;
}

void main() {
  test(('testCase #1'), () {
    expect(minNumberOfCoins(7, [1, 5, 10]), equals(3));
  });

  test(('testCase #2'), () {
    expect(minNumberOfCoins(7, [3, 5]), equals(-1));
  });

  test(('testCase #3'), () {
    expect(minNumberOfCoins(9, [3, 4, 5]), equals(2));
  });
}
