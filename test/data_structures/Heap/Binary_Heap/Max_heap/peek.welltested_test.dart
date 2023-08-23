import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/Max_heap.dart';

void main() {
  group('MaxHeap Tests', () {
    test('Test case 1: Non-empty heap', () {
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap(array);

      expect(maxHeap.peek(), equals(391));
      maxHeap.remove();
      expect(maxHeap.peek(), equals(56));

      maxHeap.insert(-100);
      expect(maxHeap.peek(), equals(56));

      maxHeap.insert(1000);
      expect(maxHeap.peek(), equals(1000));

      maxHeap.remove();
      expect(maxHeap.peek(), equals(56));

      expect(maxHeap.isEmpty(), isFalse);
    });

    test('Test case 2: Non-empty heap with negative numbers', () {
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

      expect(maxHeap.peek(), equals(10));
      maxHeap.remove();
      expect(maxHeap.peek(), equals(9));

      maxHeap.insert(890);
      expect(maxHeap.peek(), equals(890));

      maxHeap.remove();
      expect(maxHeap.peek(), equals(9));

      expect(maxHeap.isEmpty(), isFalse);

      maxHeap.insert(1);
      expect(maxHeap.peek(), equals(9));
    });

    test('Test case 3: Empty heap', () {
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap([]);
      expect(maxHeap.peek(), isNull);
      expect(maxHeap.isEmpty(), isTrue);
    });

    test('Test case 4: Single element heap', () {
      MaxHeap maxHeap = new MaxHeap();
      maxHeap.buildHeap([]);
      maxHeap.insert(5);
      expect(maxHeap.peek(), equals(5));
      expect(maxHeap.isEmpty(), isFalse);
    });
  });
}
