import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/min_heap_two.dart';

void main() {
  group('MinHeap insert tests', () {
    test('Test case 1: Inserting a single value', () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      minHeap.insert(5);
      expect(minHeap.heap.length, equals(1));
      expect(minHeap.heap[0], equals(5));
    });

    test('Test case 2: Inserting multiple values', () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      minHeap.insert(5);
      minHeap.insert(3);
      minHeap.insert(8);
      expect(minHeap.heap.length, equals(3));
      expect(minHeap.heap[0], equals(3));
      expect(minHeap.heap[1], equals(5));
      expect(minHeap.heap[2], equals(8));
    });

    test('Test case 3: Inserting duplicate values', () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      minHeap.insert(5);
      minHeap.insert(3);
      minHeap.insert(5);
      expect(minHeap.heap.length, equals(3));
      expect(minHeap.heap[0], equals(3));
      expect(minHeap.heap[1], equals(5));
      expect(minHeap.heap[2], equals(5));
    });

    test('Test case 4: Inserting negative values', () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      minHeap.insert(-5);
      minHeap.insert(-3);
      minHeap.insert(-8);
      expect(minHeap.heap.length, equals(3));
      expect(minHeap.heap[0], equals(-8));
      expect(minHeap.heap[1], equals(-5));
      expect(minHeap.heap[2], equals(-3));
    });

    test('Test case 5: Inserting values in descending order', () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      minHeap.insert(5);
      minHeap.insert(4);
      minHeap.insert(3);
      minHeap.insert(2);
      minHeap.insert(1);
      expect(minHeap.heap.length, equals(5));
      expect(minHeap.heap[0], equals(1));
      expect(minHeap.heap[1], equals(2));
      expect(minHeap.heap[2], equals(3));
      expect(minHeap.heap[3], equals(5));
      expect(minHeap.heap[4], equals(4));
    });

    test('Test case 6: Inserting values in ascending order', () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      minHeap.insert(1);
      minHeap.insert(2);
      minHeap.insert(3);
      minHeap.insert(4);
      minHeap.insert(5);
      expect(minHeap.heap.length, equals(5));
      expect(minHeap.heap[0], equals(1));
      expect(minHeap.heap[1], equals(2));
      expect(minHeap.heap[2], equals(3));
      expect(minHeap.heap[3], equals(4));
      expect(minHeap.heap[4], equals(5));
    });

    test(
        'Test case 7: Inserting a mix of positive, negative, and duplicate values',
        () {
      MinHeap minHeap = MinHeap();
      minHeap.buildHeap([]);
      minHeap.insert(5);
      minHeap.insert(-3);
      minHeap.insert(5);
      minHeap.insert(2);
      minHeap.insert(-8);
      expect(minHeap.heap.length, equals(5));
      expect(minHeap.heap[0], equals(-8));
      expect(minHeap.heap[1], equals(2));
      expect(minHeap.heap[2], equals(-3));
      expect(minHeap.heap[3], equals(5));
      expect(minHeap.heap[4], equals(5));
    });
  });
}
