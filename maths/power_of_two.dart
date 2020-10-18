void power_of_two(int n) {
  int result = n & (n - 1);
  if (result == 0)
    print("Yes, the number $n is a power of 2");
  else
    print("No, the number $n is not a power of 2");
}

void main() {
  power_of_two(10);
  power_of_two(23);
  power_of_two(32);
  power_of_two(2234);
  power_of_two(2048);
}
