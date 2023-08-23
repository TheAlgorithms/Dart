import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/min_heap_two.dart';

void main() {
  group('MinHeap buildHeap tests', () {
    test('Test case 1: buildHeap with a given array', () {
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.heap,
          equals([-5, 2, 6, 7, 8, 24, 8, 391, 24, 56, 12, 24, 41]));
    });

    test('Test case 2: buildHeap with another given array', () {
      List<int> array = [
        -7,
        2,
        3,
        8,
        -10,
        4,
        -6,
        -10,
        -2,
        -7,
        10,
        5,
        2,
        9,
        -9,
        -5,
        3,
        8
      ];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(
          minHeap.heap,
          equals([
            -10,
            -10,
            -9,
            -7,
            -7,
            -6,
            -5,
            2,
            -2,
            3,
            10,
            5,
            2,
            9,
            3,
            4,
            8,
            8
          ]));
    });

    test('Test case 3: buildHeap with an empty array', () {
      List<int> array = [];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.heap, equals([]));
    });

    test('Test case 4: buildHeap with a single element array', () {
      List<int> array = [5];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.heap, equals([5]));
    });

    test('Test case 5: buildHeap with a sorted array', () {
      List<int> array = [-5, 0, 3, 7, 10];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.heap, equals([-5, 0, 3, 7, 10]));
    });

    test('Test case 6: buildHeap with a reverse sorted array', () {
      List<int> array = [10, 7, 3, 0, -5];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.heap, equals([-5, 0, 3, 7, 10]));
    });

    test('Test case 7: buildHeap with an array containing duplicates', () {
      List<int> array = [3, 7, 3, 1, 2, 7, 1, 2];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.heap, equals([1, 1, 3, 2, 2, 7, 3, 7]));
    });
  });
}
