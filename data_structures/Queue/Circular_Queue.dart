// author: kjain1810
// reference: https://en.wikipedia.org/wiki/Circular_buffer
const int MAX_SIZE = 10;

class CircularQueue<T> {
  int start = -1, end = -1;
  List<T> queue = new List<T>(MAX_SIZE);

  // insert elements into the queue
  void enque(T element) {
    if (start == -1) {
      start = 0;
      end = 0;
      queue[0] = element;
      return;
    }
    if (end == MAX_SIZE - 1 && start == 0) {
      print("The queue is full!!!");
      return;
    }
    if (end == start - 1) {
      print("The queue is full!!!");
      return;
    }
    end++;
    end %= MAX_SIZE;
    queue[end] = element;
  }

  // remove elements from the queue
  T deque() {
    if (start == -1) {
      print("The queue is empty!!!");
      return null;
    }
    T here = queue[start];
    if (start == end) {
      start = -1;
      end = -1;
      return here;
    }
    start++;
    start %= MAX_SIZE;
    return here;
  }

  // get the size of the queue
  int size() {
    if (start == -1) return 0;
    if (start < end) return end - start + 1;
    return (MAX_SIZE - (start - end));
  }

  // print all the elements of the queue
  void printAll() {
    if (start == -1) {
      print("The queue is empty!!!");
      return;
    }
    int i = start;
    while (i != end) {
      i++;
      i %= MAX_SIZE;
      print(queue[i]);
    }
  }
}

void main() {
  CircularQueue<int> Queue = new CircularQueue<int>();
  Queue.enque(1);
  Queue.enque(2);
  Queue.enque(3);
  Queue.enque(4);
  Queue.printAll();
  Queue.deque();
  Queue.printAll();
  Queue.deque();
  print(Queue.size());
}
