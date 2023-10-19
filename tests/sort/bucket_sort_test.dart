import 'package:test/test.dart';
import '../../sort/bucket_sort.dart';

void main() {
  test('Test case 1', () {
    List<double> arr = [0.42, 0.32, 0.33, 0.52, 0.37, 0.47, 0.51];
    bucketSort(arr);
    expect(arr, orderedEquals([0.32, 0.33, 0.37, 0.42, 0.47, 0.51, 0.52]));
  });

  test('Test case 2', () {
    List<double> arr = [5.0, 4.0, 3.0, 2.0, 1.0];
    bucketSort(arr);
    expect(arr, orderedEquals([1.0, 2.0, 3.0, 4.0, 5.0]));
  });

  test('Test case 3', () {
    List<double> arr = [1.1, 2.2, 3.3, 4.4, 5.5];
    bucketSort(arr);
    expect(arr, orderedEquals([1.1, 2.2, 3.3, 4.4, 5.5]));
  });

  test('Test case 4 (Empty List)', () {
    List<double> arr = [];
    bucketSort(arr);
    expect(arr, orderedEquals([]));
  });

  test('Test case 5 (Already Sorted)', () {
    List<double> arr = [1.0, 2.0, 3.0, 4.0, 5.0];
    bucketSort(arr);
    expect(arr, orderedEquals([1.0, 2.0, 3.0, 4.0, 5.0]));
  });

  test('Test case 6 (Reverse Sorted)', () {
    List<double> arr = [5.0, 4.0, 3.0, 2.0, 1.0];
    bucketSort(arr);
    expect(arr, orderedEquals([1.0, 2.0, 3.0, 4.0, 5.0]));
  });

  test('Test case 7 (All Equal)', () {
    List<double> arr = [2.0, 2.0, 2.0, 2.0, 2.0];
    bucketSort(arr);
    expect(arr, orderedEquals([2.0, 2.0, 2.0, 2.0, 2.0]));
  });
}