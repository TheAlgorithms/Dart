import 'package:test/test.dart';

int majorityElement(List<int> arr, int n) {
  arr.sort();

  var count = 1, max_ele = -1, temp = arr[0], ele = 0, f = 0;

  for (int i = 1; i < n; i++) {
    if (temp == arr[i]) {
      count++;
    } else {
      count = 1;
      temp = arr[i];
    }
    if (max_ele < count) {
      max_ele = count;
      ele = arr[i];

      if (max_ele > (n / 2)) {
        f = 1;
        break;
      }
    }
  }
  return (f == 1 ? ele : -1);
}

// Driver code
void main() {
  test("majorityElement", () {
    List<int> a1 = [1, 2, 2, 2, 2, 5, 1];
    expect(majorityElement(a1, a1.length), equals(2));

    List<int> a2 = [30, 30, 40, 30, 40, 30, 40];
    expect(majorityElement(a2, a2.length), equals(30));
  });

  test("majorityElement returns -1 when there is no dominant element", () {
    List<int> a1 = [3, 3, 22, 21, 21, 5, 21];
    expect(majorityElement(a1, a1.length), equals(-1));

    List<int> a2 = [100, 4000, 220, 220, 220, 100, 4000];
    expect(majorityElement(a2, a2.length), equals(-1));
  });
}
