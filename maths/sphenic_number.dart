import 'package:test/test.dart';

var arr = new List<bool>.filled(1001, true, growable: false);
void simple_seive() {
  for (int p = 2; p * p < 1001; p++) {
    if (arr[p]) {
      for (int i = p * 2; i < 1001; i = i + p) arr[i] = false;
    }
  }
}

bool sphenic_number(int N) {
  var arr1 = new List<int>.filled(9, 0, growable: false);

  var count = 0;
  var j = 0;

  for (int i = 1; i <= N; i++) {
    if (N % i == 0 && count < 9) {
      count++;
      arr1[j] = i;
      j++;
    }
  }

  return (count == 8 && arr[arr1[0]] && arr[arr1[1]] && arr[arr1[2]]);
}

void main() {
  simple_seive();
  test("Test Sphenic_no returns false for non-sphenic numbers", () {
    expect(sphenic_number(0), isFalse);
    expect(sphenic_number(371), isFalse);
    expect(sphenic_number(509), isFalse);
    expect(sphenic_number(501), isFalse);
  });
  test("Test sphenic_no returns true for sphenic numbers", () {
    expect(sphenic_number(370), isTrue);
  });
}
