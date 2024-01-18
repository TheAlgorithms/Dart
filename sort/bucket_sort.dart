import 'dart:math';
///This algorithm uses the bucket sort algorithm to sort a list of doubles.
///The algorithm is as follows:
///1. Find the maximum and minimum values in the list.
///2. Create a list of buckets, where each bucket is a list of doubles.
///3. For each value in the list, add it to the bucket corresponding to its index.
///4. Sort each bucket.
///5. Concatenate the buckets together.
///The algorithm is O(n) in the best case, and O(n^2) in the worst case.
///Source: https://en.wikipedia.org/wiki/Bucket_sort

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
