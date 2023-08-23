import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/Max_heap.dart';

void main() {
  group('MaxHeap insert tests', () {
    test('Test case 1: Inserting into an empty heap', () {
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.insert(5);
      expect(maxHeap.peek(), equals(5));
    });

    test('Test case 2: Inserting into a non-empty heap', () {
      MaxHeap maxHeap = new MaxHeap();
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      maxHeap.buildHeap(array);
      maxHeap.insert(100);
      expect(maxHeap.peek(), equals(391));
    });

    test('Test case 3: Inserting a value smaller than the current max', () {
      MaxHeap maxHeap = new MaxHeap();
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      maxHeap.buildHeap(array);
      maxHeap.insert(50);
      expect(maxHeap.peek(), equals(391));
    });

    test('Test case 4: Inserting a value larger than the current max', () {
      MaxHeap maxHeap = new MaxHeap();
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      maxHeap.buildHeap(array);
      maxHeap.insert(500);
      expect(maxHeap.peek(), equals(500));
    });

    test('Test case 5: Inserting a value equal to the current max', () {
      MaxHeap maxHeap = new MaxHeap();
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      maxHeap.buildHeap(array);
      maxHeap.insert(391);
      expect(maxHeap.peek(), equals(391));
    });

    test('Test case 6: Inserting a negative value', () {
      MaxHeap maxHeap = new MaxHeap();
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      maxHeap.buildHeap(array);
      maxHeap.insert(-10);
      expect(maxHeap.peek(), equals(391));
    });
  });
}
