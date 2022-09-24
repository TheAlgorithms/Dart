import 'package:test/test.dart';

class Node<T> {
  Node<T>? next;
  T value;

  Node(this.value);
  Node.before(this.next, this.value);
}

class LinkedListIterator<T> extends Iterator<T> {
  Node<T>? _current;

  @override
  bool moveNext() => _current != null;

  @override
  T get current {
    T currentValue = _current!.value;

    _current = _current!.next;

    return currentValue;
  }

  LinkedListIterator(this._current);
}

class LinkedList<T> extends Iterable<T> {
  int _length = 0;
  @override
  int get length => _length;

  Node<T>? _head;

  @override
  Iterator<T> get iterator => LinkedListIterator<T>(_head);

  void remove(T item) {
    if (_head?.value == item) {
      _head = _head?.next;
      _length--;
    }

    if (_head != null) {
      Node<T>? current = _head;
      while (current?.next != null) {
        if (current!.next!.value == item) {
          current.next = current.next!.next;
          _length--;
        }

        current = current.next;
      }
    }
  }

  T? pop() {
    if (_head != null) {
      T value = _head!.value;
      _head = _head!.next;
      _length--;

      return value;
    }

    return null;
  }

  void push(T item) {
    _head = Node.before(_head, item);
    _length++;
  }

  void add(T item) {
    if (_head == null) {
      _head = Node(item);
    } else {
      Node<T>? current = _head;
      while (current?.next != null) {
        current = current!.next;
      }

      current!.next = Node(item);
    }
    _length++;
  }
}

main() {
  test('.add is adding elements in order', () {
    LinkedList<double> linkedList = LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);

    expect(linkedList, equals([1, 2, 3]));
  });

  test('.remove is removing all elements with given value', () {
    LinkedList<double> linkedList = LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);
    linkedList.add(2);

    linkedList.remove(2);

    expect(linkedList, equals([1, 3]));
  });

  test('.remove on empty list do nothing', () {
    LinkedList<double> linkedList = LinkedList();

    linkedList.remove(2);

    expect(linkedList, isEmpty);
  });

  test('.push is appending first element', () {
    LinkedList<double> linkedList = LinkedList();

    linkedList.push(1);
    expect(linkedList, equals([1]));

    linkedList.push(2);
    expect(linkedList, equals([2, 1]));

    linkedList.push(3);
    expect(linkedList, equals([3, 2, 1]));
  });

  test('.pop is returning and removing first element', () {
    LinkedList<double> linkedList = LinkedList();

    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);

    expect(linkedList.pop(), equals(1));
    expect(linkedList, equals([2, 3]));

    expect(linkedList.pop(), equals(2));
    expect(linkedList, equals([3]));

    expect(linkedList.pop(), equals(3));
    expect(linkedList, equals([]));
  });

  test('.pop is returning null when list is empty', () {
    LinkedList<double> linkedList = LinkedList();

    expect(linkedList.pop(), isNull);
  });
}
