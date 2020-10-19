import 'package:test/test.dart';

bool power_of_two(int n) {
  if (n == 0) return false;

  return (n & (n - 1)) == 0;
}

void main() {
  test("Test power_of_two 0 returns false", () {
    expect(power_of_two(0), isFalse);
  });

  test("Test power_of_two 1 returns true", () {
    expect(power_of_two(1), isTrue);
  });

  test("Test power_of_two 10 returns false", () {
    expect(power_of_two(10), isFalse);
  });

  test("Test power_of_two 10 returns false", () {
    expect(power_of_two(10), isFalse);
  });

  test("Test power_of_two 23 returns false", () {
    expect(power_of_two(23), isFalse);
  });

  test("Test power_of_two 32 returns true", () {
    expect(power_of_two(32), isTrue);
  });

  test("Test power_of_two 2234 returns false", () {
    expect(power_of_two(2234), isFalse);
  });

  test("Test power_of_two 2048 returns true", () {
    expect(power_of_two(2048), isTrue);
  });
}
