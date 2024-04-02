class PriorityQueue<T> {
  List<QueueItem<T>> _dataStore = <QueueItem<T>>[];

  int get size => _dataStore.length;

  bool get isEmpty => _dataStore.isEmpty;

  enqueue(T item, int priority) {
    QueueItem<T> queueItem = new QueueItem<T>(item, priority);
    bool added = false;
    for (int i = 0; i < _dataStore.length; i++) {
      if (priority < _dataStore[i].priority) {
        added = true;
        _dataStore.insert(i, queueItem);
        break;
      }
    }
    if (!added) {
      _dataStore.add(queueItem);
    }
  }

  T? dequeue() {
    if (_dataStore.isNotEmpty) {
      return _dataStore.removeAt(0).item;
    }
    return null;
  }

  T? get front {
    if (_dataStore.isNotEmpty) {
      return _dataStore.first.item;
    }
    return null;
  }

  T? get end {
    if (_dataStore.isNotEmpty) {
      return _dataStore.last.item;
    }
    return null;
  }

  clear() {
    _dataStore.clear();
  }

  String toString() {
    return _dataStore.toString();
  }
}

class QueueItem<T> {
  T item;
  int priority;

  QueueItem(this.item, this.priority);

  String toString() {
    return '$item - $priority';
  }
}

void main() {
  PriorityQueue<int> queue = new PriorityQueue();
  queue.enqueue(1, 2);
  queue.enqueue(2, 1);
  queue.enqueue(3, 3);
  queue.enqueue(4, 2);

  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.dequeue());
}
