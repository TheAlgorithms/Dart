import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/Max_heap.dart';

void main() {
  group('MaxHeap buildHeap tests', () {
    test('Test case 1: buildHeap with a valid array', () {
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.heap,
          equals([391, 56, 41, 24, 48, 8, 24, 7, 12, 24, 2, 6, -5, 8]));
    });

    test(
        'Test case 2: buildHeap with a valid array containing negative numbers',
        () {
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
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(
          maxHeap.heap,
          equals([
            10,
            9,
            8,
            8,
            5,
            4,
            3,
            -2,
            -7,
            -7,
            3,
            -10,
            2,
            -6,
            -9,
            -5,
            -10,
            2
          ]));
    });

    test('Test case 3: buildHeap with an empty array', () {
      List<int> array = [];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.heap, equals([]));
    });

    test('Test case 4: buildHeap with a single element array', () {
      List<int> array = [5];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.heap, equals([5]));
    });

    test('Test case 5: buildHeap with a sorted array', () {
      List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.heap, equals([9, 5, 8, 4, 2, 6, 7, 1, 3]));
    });

    test('Test case 6: buildHeap with a reverse sorted array', () {
      List<int> array = [9, 8, 7, 6, 5, 4, 3, 2, 1];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.heap, equals([9, 8, 7, 6, 5, 4, 3, 2, 1]));
    });
  });
}
