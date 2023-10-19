import 'dart:math';

void bucketSort(List<double> arr) {
  int n = arr.length;

  if (n <= 1) return;

  double maxVal = arr.reduce(max);
  double minVal = arr.reduce(min);

  List<List<double>> buckets = List.generate(n, (index) => []);

  int calculateBucketIndex(double value, double minVal, double maxVal, int n) {
    if (value.isNaN || value.isInfinite) {
      return 0;
    }
    if (maxVal == minVal) {
      return 0;
    }
    return ((value - minVal) / (maxVal - minVal) * (n - 1)).floor();
  }

  for (int i = 0; i < n; i++) {
    int bucketIndex = calculateBucketIndex(arr[i], minVal, maxVal, n);
    buckets[bucketIndex].add(arr[i]);
  }

  int index = 0;
  for (int i = 0; i < n; i++) {
    if (buckets[i].isNotEmpty) {
      buckets[i].sort();
      for (int j = 0; j < buckets[i].length; j++) {
        arr[index++] = buckets[i][j];
      }
    }
  }
}