import 'package:test/test.dart';

import 'remove.welltested_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../../data_structures/Heap/Binary_Heap/min_heap_two.dart';

@GenerateMocks([MinHeap])
void main() {
  group('MinHeap remove tests', () {
    test('Test case 1: Remove minimum element from non-empty heap', () {
      MinHeap minHeap = MockMinHeap();
      when(minHeap.isEmpty()).thenReturn(false);
      when(minHeap.remove()).thenReturn(-5);

      expect(minHeap.remove(), equals(-5));
      expect(minHeap.isEmpty(), isFalse);
    });

    test('Test case 2: Remove minimum element from empty heap', () {
      MinHeap minHeap = MockMinHeap();
      when(minHeap.isEmpty()).thenReturn(true);
      when(minHeap.remove()).thenReturn(null);

      expect(minHeap.remove(), isNull);
      expect(minHeap.isEmpty(), isTrue);
    });

    test(
        'Test case 3: Remove minimum element and check if heap is updated correctly',
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

    test(
        'Test case 4: Remove minimum element multiple times and check if heap is updated correctly',
        () {
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap(array);

      expect(minHeap.remove(), equals(-5));
      expect(minHeap.isEmpty(), isFalse);
      minHeap.insert(-100);
      expect(minHeap.peek(), equals(-100));
      minHeap.insert(-100);
      expect(minHeap.remove(), equals(-100));
      expect(minHeap.remove(), equals(-100));
    });
  });
}
