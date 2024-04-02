import 'package:test/test.dart';

//Title:  Nth Fibonacci Number using Dynamic Programming
//Author: Richik Chanda
//Email:  richikchanda1999@gmail.com
List<int> dp = [];
int mod = (1e9 + 7).toInt();

//Get the nth Fibonacci number modulo 10^9 + 7 since it can be a very large number
int getFib(int n) {
  if (dp[n] == -1) dp[n] = (getFib(n - 1) % mod) + (getFib(n - 2) % mod);
  return dp[n] % mod;
}

//Driver
void main() {
  dp = List.generate((1e6 + 1).toInt(), (e) => -1);
  dp[0] = 0;
  dp[1] = 1;

  test("getFib 0 equals 0", () {
    expect(getFib(0), equals(0));
  });

  test("getFib 1 equals 1", () {
    expect(getFib(1), equals(1));
  });

  test("getFib 5 equals 5", () {
    expect(getFib(5), equals(5));
  });

  test("getFib(n) equals getFib(n - 1) + getFib(n - 2)", () {
    expect(getFib(7), equals(getFib(6) + getFib(5)));
    expect(getFib(14), equals(getFib(13) + getFib(12)));
  });
}
