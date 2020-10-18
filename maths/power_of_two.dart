import 'package:test/test.dart';

bool power_of_two(int n) {
  return (n & (n - 1)) == 0;
}

void main() {
  power_of_two(10);
  power_of_two(23);
  power_of_two(32);
  power_of_two(2234);
  power_of_two(2048);
}
