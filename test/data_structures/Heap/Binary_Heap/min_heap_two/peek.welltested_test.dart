import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/min_heap_two.dart';

@GenerateMocks([MinHeap])
void main() {
  group('MinHeap.peek()', () {
    test('Test case 1: Non-empty heap', () {
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.peek(), equals(-5));
      expect(minHeap.isEmpty(), isFalse);
    });

    test('Test case 2: Insert and remove elements', () {
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

      expect(minHeap.remove(), equals(-10));
      expect(minHeap.peek(), equals(-10));
      minHeap.insert(-8);
      expect(minHeap.peek(), equals(-10));
      expect(minHeap.remove(), equals(-10));
      expect(minHeap.peek(), equals(-9));
      expect(minHeap.isEmpty(), isFalse);
      minHeap.insert(-8);
      expect(minHeap.peek(), equals(-9));
    });

    test('Test case 3: Empty heap', () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      expect(minHeap.peek(), isNull);
      expect(minHeap.isEmpty(), isTrue);
    });

    test('Test case 4: Single element heap', () {
      List<int> array = [5];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.peek(), equals(5));
      expect(minHeap.isEmpty(), isFalse);
    });

    test('Test case 5: Heap with duplicate elements', () {
      List<int> array = [1, 2, 3, 1, 2, 3];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.peek(), equals(1));
      expect(minHeap.isEmpty(), isFalse);
    });
  });
}
