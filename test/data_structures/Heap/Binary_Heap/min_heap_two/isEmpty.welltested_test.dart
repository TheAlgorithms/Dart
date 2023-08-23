import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import '../../../../../data_structures/Heap/Binary_Heap/min_heap_two.dart';

@GenerateMocks([MinHeap])
void main() {
  group('MinHeap isEmpty tests', () {
    test('Test case 1: Non-empty heap', () {
      List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
      MinHeap minheap = new MinHeap();
      minheap.buildHeap(array);

      expect(minheap.isEmpty(), isFalse);
    });

    test('Test case 2: Empty heap', () {
      MinHeap minheap = new MinHeap();
      minheap.buildHeap([]);

      expect(minheap.isEmpty(), isTrue);
    });

    test('Test case 3: Heap with one element', () {
      List<int> array = [5];
      MinHeap minheap = new MinHeap();
      minheap.buildHeap(array);

      expect(minheap.isEmpty(), isFalse);
    });

    test('Test case 4: Heap with negative numbers', () {
      List<int> array = [-5, -10, -15, -20];
      MinHeap minheap = new MinHeap();
      minheap.buildHeap(array);

      expect(minheap.isEmpty(), isFalse);
    });

    test('Test case 5: Heap with duplicate elements', () {
      List<int> array = [5, 5, 5, 5, 5];
      MinHeap minheap = new MinHeap();
      minheap.buildHeap(array);

      expect(minheap.isEmpty(), isFalse);
    });

    test('Test case 6: Heap with mixed positive and negative numbers', () {
      List<int> array = [5, -5, 10, -10, 15, -15];
      MinHeap minheap = new MinHeap();
      minheap.buildHeap(array);

      expect(minheap.isEmpty(), isFalse);
    });
  });
}
