//Title:  Nth Fibonacci Number using Dynamic Programming
//Author: Richik Chanda
//Email:  richikchanda1999@gmail.com
List<int> dp;
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

  getFib(100);
  //Printing the first 100 fibonacci numbers
  print("First 100 Fibonacci numbers: ${dp.sublist(1, 100)}");
}
