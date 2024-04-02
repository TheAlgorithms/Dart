//Author:Shawn
//Email:stepfencurryxiao@gmail.com

const int MAX_SIZE = 10;

class ListQueue<T> {
  int count = 0;
  List<T?> queue = List.filled(MAX_SIZE, null);

  //Checks if the queue has elements (not empty)
  bool hasElements() {
    if (queue.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  //Add an element to the queue
  void enque(T element) {
    if (count == MAX_SIZE) {
      print("The queue is full!!!");
    } else {
      queue[count] = element;
      count++;
    }
  }

  //Takes the next element from the queue
  T? deque() {
    T? result = null;
    if (count == 0) {
      print("The queue is empty!!!");
    } else {
      result = queue[0];
      for (int i = 0; i < queue.length - 1; i++) {
        queue[i] = queue[i + 1];
      }
    }
    return result;
  }
}

void main() {
  ListQueue<int> Queue = new ListQueue<int>();
  Queue.enque(12);
  Queue.enque(2);
  Queue.enque(7);
  print(Queue.queue);
  print("Enqueue:");
  var returnData = Queue.deque();
  print("$returnData\n");
  print("Enqueue:");
  returnData = Queue.deque();
  print("$returnData\n");
  print("Enqueue:");
  returnData = Queue.deque();
  print("$returnData\n");
  print("Now the queue is: " + (Queue.queue).toString());
}
