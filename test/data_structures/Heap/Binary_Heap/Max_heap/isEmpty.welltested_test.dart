import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/Max_heap.dart';

void main() {
  group('MaxHeap isEmpty tests', () {
    test('Test case 1: Non-empty heap', () {
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.isEmpty(), isFalse);
    });

    test('Test case 2: Empty heap', () {
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap([]);
      expect(maxHeap.isEmpty(), isTrue);
    });

    test('Test case 3: Heap with one element', () {
      List<int> array = [5];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.isEmpty(), isFalse);
    });

    test('Test case 4: Heap with negative elements', () {
      List<int> array = [-7, -10, -6, -10, -2, -7, -9, -5];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.isEmpty(), isFalse);
    });

    test('Test case 5: Heap with all zero elements', () {
      List<int> array = [0, 0, 0, 0, 0];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.isEmpty(), isFalse);
    });
  });
}
