import 'package:test/test.dart';

class MinHeap {
  List<int> heap;

  void buildHeap(List<int> array) {
    this.heap = _heapify(array);
  }

  List<int> _heapify(List<int> array) {
    int firstParent;
    firstParent = (array.length - 2) ~/ 2;
    for (int i = firstParent; i >= 0; i--) {
      _siftDown(i, array.length - 1, array);
    }
    return array;
  }

  int peek() {
    if (!isEmpty()) {
      return this.heap[0];
    }
    return null;
  }

  bool isEmpty() {
    return this.heap.length == 0;
  }

  void _siftUp(int currentIndex) {
    int parentIndex;
    parentIndex = (currentIndex - 1) ~/ 2;
    while (
        parentIndex >= 0 && this.heap[parentIndex] > this.heap[currentIndex]) {
      _swap(parentIndex, currentIndex, this.heap);
      currentIndex = parentIndex;
      parentIndex = (currentIndex - 1) ~/ 2;
    }
  }

  void _siftDown(int currentIndex, int endIndex, List<int> heap) {
    int childOneIndex = (2 * currentIndex) + 1;
    int childTwoIndex;

    while (childOneIndex <= endIndex) {
      childTwoIndex =
          2 * currentIndex + 2 <= endIndex ? 2 * currentIndex + 2 : -1;
      int indexToSwap;
      if (childTwoIndex != -1 && heap[childTwoIndex] < heap[childOneIndex]) {
        indexToSwap = childTwoIndex;
      } else {
        indexToSwap = childOneIndex;
      }

      if (heap[currentIndex] > heap[indexToSwap]) {
        _swap(currentIndex, indexToSwap, heap);
        currentIndex = indexToSwap;
        childOneIndex = (2 * currentIndex) + 1;
      } else {
        break;
      }
    }
  }

  void insert(int value) {
    this.heap.add(value);
    _siftUp(this.heap.length - 1);
  }

  int remove() {
    if (!isEmpty()) {
      _swap(0, this.heap.length - 1, this.heap);
      int minElement = this.heap.removeLast();
      _siftDown(0, this.heap.length - 1, this.heap);
      return minElement;
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
  MinHeap minheap = new MinHeap();
  List<int> array = [48, 12, 24, 7, 8, -5, 24, 391, 24, 56, 2, 6, 8, 41];
  minheap.buildHeap(array);
  test(('remove'), () {
    expect(minheap.remove(), equals(-5));
  });

  test(('insert and peek'), () {
    minheap.insert(-100);
    expect(minheap.peek(), equals(-100));
  });

  test(('insert and remove'), () {
    minheap.insert(-100);
    expect(minheap.remove(), equals(-100));
  });

  test(('remove'), () {
    expect(minheap.remove(), equals(-100));
  });

  test(('remove'), () {
    expect(minheap.peek(), equals(2));
  });
}
