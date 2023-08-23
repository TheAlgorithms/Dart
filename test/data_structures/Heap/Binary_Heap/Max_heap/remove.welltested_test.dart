import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/Max_heap.dart';

void main() {
  group('MaxHeap remove tests', () {
    test('Test case 1: Remove max element and insert new elements', () {
      MaxHeap maxHeap = new MaxHeap();
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      maxHeap.buildHeap(array);

      expect(maxHeap.remove(), equals(391));
      maxHeap.insert(-100);
      expect(maxHeap.isEmpty(), isFalse);
      expect(maxHeap.peek(), equals(56));
      maxHeap.insert(1000);
      expect(maxHeap.peek(), equals(1000));
      expect(maxHeap.remove(), equals(1000));
      expect(maxHeap.remove(), equals(56));
    });

    test(
        'Test case 2: Remove max element and insert new elements with negative numbers',
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

      expect(maxHeap.remove(), equals(10));
      expect(maxHeap.peek(), equals(9));
      maxHeap.insert(890);
      expect(maxHeap.peek(), equals(890));
      expect(maxHeap.remove(), equals(890));
      expect(maxHeap.peek(), equals(9));
      expect(maxHeap.isEmpty(), isFalse);
      maxHeap.insert(1);
      expect(maxHeap.peek(), equals(9));
    });

    test('Test case 3: Remove max element from an empty heap', () {
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap([]);
      expect(maxHeap.remove(), isNull);
    });

    test('Test case 4: Remove max element from a heap with one element', () {
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap([]);
      maxHeap.insert(42);
      expect(maxHeap.remove(), equals(42));
      expect(maxHeap.isEmpty(), isTrue);
    });

    test('Test case 5: Remove max element from a heap with duplicate elements',
        () {
      List<int> array = [5, 5, 5, 5, 5];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.remove(), equals(5));
      expect(maxHeap.peek(), equals(5));
      expect(maxHeap.isEmpty(), isFalse);
    });
  });
}
