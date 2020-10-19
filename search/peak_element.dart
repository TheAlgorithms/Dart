import 'package:test/test.dart';

int findPeakUtil(List<int> arr, int low, int high, int n) {
  var x = (low + high) / 2;
  int mid = x.toInt();
  if ((mid == 0 || arr[mid - 1] <= arr[mid]) &&
      (mid == n - 1 || arr[mid + 1] <= arr[mid]))
    return mid;
  else if (mid > 0 && arr[mid - 1] > arr[mid])
    return findPeakUtil(arr, low, (mid - 1), n);
  else
    return findPeakUtil(arr, (mid + 1), high, n);
}

int findPeak(List<int> arr, int n) {
  return findPeakUtil(arr, 0, n - 1, n);
}

void main() {
  test("findPeak returns 2 for [1, 3, 20, 6, 1, 2]", () {
    List<int> lst = [1, 3, 20, 6, 1, 2];
    expect(findPeak(lst, lst.length), equals(2));
  });

  test("findPeak returns 3 for [1, 3, 20, 32, 1, 2]", () {
    List<int> lst = [1, 3, 20, 32, 1, 2];
    expect(findPeak(lst, lst.length), equals(3));
  });

  test("findPeak returns 2 for [321, 4353, 22320, 232, 23, 223]", () {
    List<int> lst = [321, 4353, 22320, 232, 23, 223];
    expect(findPeak(lst, lst.length), equals(2));
  });

  test("findPeak returns 2 for [121, 54, 2100, 36, 155, 90]", () {
    List<int> lst = [121, 54, 2100, 36, 155, 90];
    expect(findPeak(lst, lst.length), equals(2));
  });

  test("findPeak returns 2 for [5, 10, 20, 15]", () {
    List<int> lst = [5, 10, 20, 15];
    expect(findPeak(lst, lst.length), equals(2));
  });

  test("findPeak returns 1 for [10, 20, 15, 2, 23, 90, 67]", () {
    List<int> lst = [10, 20, 15, 2, 23, 90, 67];
    expect(findPeak(lst, lst.length), equals(1));
  });
}
