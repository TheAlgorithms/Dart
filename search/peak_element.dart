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
  List<int> a = [1, 3, 20, 6, 1, 2];
  print(findPeak(a, a.length));
  List<int> b = [1, 3, 20, 32, 1, 2];
  print(findPeak(b, b.length));
  List<int> c = [321, 4353, 22320, 232, 23, 223];
  print(findPeak(c, c.length));
  List<int> d = [121, 54, 2100, 36, 155, 90];
  print(findPeak(d, d.length));
}
