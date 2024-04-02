import 'package:test/test.dart';

List N_bonacci(int n, int m) {
  List<int> v = List.generate(m, (index) => 0);
  var i;
  for (i = 0; i < m; i++) {
    v[i] = 0;
  }
  v[n - 1] = 1;
  v[n] = 1;
  for (i = n + 1; i < m; i++) {
    v[i] = 2 * v[i - 1] - v[i - 1 - n];
  }

  return v;
}

void main() {
  test("For n=2 N_bonacci is same as fibbonaci", () {
    expect(N_bonacci(2, 6), equals([0, 1, 1, 2, 3, 5]));
  });

  test("For n=3 N_bonacci is same as tribbonaci", () {
    expect(N_bonacci(3, 7), equals([0, 0, 1, 1, 2, 4, 7]));
  });

  test("n=4 N_bonacci", () {
    expect(N_bonacci(4, 10), equals([0, 0, 0, 1, 1, 2, 4, 8, 15, 29]));
  });

  test("n=6 N_bonacci", () {
    expect(N_bonacci(6, 10), equals([0, 0, 0, 0, 0, 1, 1, 2, 4, 8]));
  });

  test("n=8 N_bonacci", () {
    expect(N_bonacci(8, 10), equals([0, 0, 0, 0, 0, 0, 0, 1, 1, 2]));
  });
}
