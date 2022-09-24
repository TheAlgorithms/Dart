import 'package:test/test.dart';

class MaxHeap {
  List<int>? heap;

  void buildHeap(List<int> array) {
    heap = _heapify(array);
  }

  List<int> _heapify(List<int> array) {
    int firstParent = (array.length - 2) ~/ 2;
    for (int i = firstParent; i >= 0; i--) {
      _siftDown(i, array.length - 1, array);
    }
    return array;
  }

  int? peek() {
    if (!isEmpty()) {
      return heap![0];
    }
    return null;
  }

  bool isEmpty() {
    return heap!.isEmpty;
  }

  void _siftUp(int currentIndex) {
    int parentIndex = (currentIndex - 1) ~/ 2;
    while (parentIndex >= 0 && heap![parentIndex] < heap![currentIndex]) {
      _swap(parentIndex, currentIndex, heap!);
      currentIndex = parentIndex;
      parentIndex = (currentIndex - 1) ~/ 2;
    }
  }

  void _siftDown(int currentIndex, int endIndex, List<int>? heap) {
    int childOneIndex = (2 * currentIndex) + 1;
    int childTwoIndex;

    while (childOneIndex <= endIndex) {
      childTwoIndex =
          2 * currentIndex + 2 <= endIndex ? 2 * currentIndex + 2 : -1;
      int indexToSwap;
      if (childTwoIndex != -1 && heap![childTwoIndex] > heap[childOneIndex]) {
        indexToSwap = childTwoIndex;
      } else {
        indexToSwap = childOneIndex;
      }

      if (heap![currentIndex] < heap[indexToSwap]) {
        _swap(currentIndex, indexToSwap, heap);
        currentIndex = indexToSwap;
        childOneIndex = (2 * currentIndex) + 1;
      } else {
        break;
      }
    }
  }

  void insert(int value) {
    heap!.add(value);
    _siftUp(heap!.length - 1);
  }

  int? remove() {
    if (!isEmpty()) {
      _swap(0, heap!.length - 1, heap!);
      int maxElement = heap!.removeLast();
      _siftDown(0, heap!.length - 1, heap);
      return maxElement;
    }
    return null;
  }

  void _swap(int left, int right, List<int> array) {
    int temp;
    temp = array[left];
    array[left] = array[right];
    array[right] = temp;
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
  maxHeap.buildHeap(array);
  test(('Test case 1'), () {
    expect(maxHeap.remove(), equals(391));
    maxHeap.insert(-100);
    expect(maxHeap.isEmpty(), isFalse);
    expect(maxHeap.peek(), equals(56));
    maxHeap.insert(1000);
    expect(maxHeap.peek(), equals(1000));
    expect(maxHeap.remove(), equals(1000));
    expect(maxHeap.remove(), equals(56));
  });

  test(('Test case 2'), () {
    array = [-7, 2, 3, 8, -10, 4, -6, -10, -2, -7, 10, 5, 2, 9, -9, -5, 3, 8];
    maxHeap = MaxHeap();
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
}
