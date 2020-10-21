import 'package:test/test.dart';

// Function to calculate nth kynea number
int nthKyneaNumber(int n) {
  // Calculate nth kynea number
  // using formula ((2^n + 1)^2 ) -2

  // Firstly calculate 2^n + 1
  n = (1 << n) + 1;

  // Now calculate (2^n + 1)^2
  n = n * n;

  // Now calculate ((2^n + 1)^2 ) - 2
  n = n - 2;

  // return nth Kynea number
  return n;
}

// Driver Program

void main() {
  test("1th Kynea number equals to 7", () {
    expect(nthKyneaNumber(1), equals(7));
  });

  test("4th Kynea number equals to 287", () {
    expect(nthKyneaNumber(4), equals(287));
  });

  test("6th Kynea number equals to 4223", () {
    expect(nthKyneaNumber(6), equals(4223));
  });

  test("10th Kynea number equals to 1050623", () {
    expect(nthKyneaNumber(10), equals(1050623));
  });
}
