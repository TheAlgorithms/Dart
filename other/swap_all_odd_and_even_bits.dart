import 'package:test/test.dart';

//we are given an integer,the tast is to get its binary representation,swap all odd and even bits and print the new number
int swapbits(int n) {
  return (((n & 0xaaaaaaaa) >> 1) | ((n & 0x55555555) << 1));
}

void main() {
  test("swapbits returns 1 for 2", () {
    expect(swapbits(2), equals(1));
  });

  test("swapbits returns 23 for 43", () {
    expect(swapbits(43), equals(23));
  });

  test("swapbits returns 43 for 23", () {
    expect(swapbits(23), equals(43));
  });
}
