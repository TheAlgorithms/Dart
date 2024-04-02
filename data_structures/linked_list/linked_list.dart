import 'package:test/test.dart';

class Node<T> {
  Node<T?>? next;
  T? value;

  Node(this.value);
  Node.before(this.next, this.value);
}

class LinkedListIterator<T> extends Iterator<T?> {
  Node<T?>? _current;

  @override
  bool moveNext() => _current != null;

  @override
  T? get current {
    T? currentValue = this._current?.value;

    this._current = this._current?.next;

    return currentValue;
  }

  LinkedListIterator(this._current);
}

class LinkedList<T> extends Iterable<T?> {
  int _length = 0;
  int get length => this._length;

  Node<T?>? _head;

  @override
  Iterator<T?> get iterator => new LinkedListIterator<T>(this._head);

  void remove(T? item) {
    if (this._head?.value == item) {
      this._head = this._head?.next;
      this._length--;
    }

    if (this._head != null) {
      Node<T?>? current = this._head;
      while (current?.next != null) {
        if (current?.next?.value == item) {
          current?.next = current.next?.next;
          this._length--;
        }

        current = current?.next;
      }
    }
  }

  T? pop() {
    if (this._head != null) {
      T? value = this._head?.value;
      this._head = this._head?.next;
      this._length--;

      return value;
    }

    return null;
  }

  void push(T item) {
    this._head = new Node.before(this._head, item);
    this._length++;
  }

  void add(T? item) {
    if (this._head == null) {
      this._head = new Node(item);
    } else {
      Node<T?>? current = this._head;
      while (current?.next != null) {
        current = current?.next;
      }

      current?.next = Node(item);
    }
    this._length++;
  }
}

main() {
  test(".add is adding elements in order", () {
    LinkedList<double> linkedList = new LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);

    expect(linkedList, equals([1, 2, 3]));
  });

  test(".remove is removing all elements with given value", () {
    LinkedList<double> linkedList = new LinkedList();
    linkedList.add(1);
    linkedList.add(2);
    linkedList.add(3);
    linkedList.add(2);

    linkedList.remove(2);

    expect(linkedList, equals([1, 3]));
  });

  test(".remove on empty list do nothing", () {
    LinkedList<double> linkedList = new LinkedList();

    linkedList.remove(2);

    expect(linkedList, isEmpty);
  });

  test(".push is appending first element", () {
    LinkedList<double> linkedList = new LinkedList();

    linkedList.push(1);
    expect(linkedList, equals([1]));

    linkedList.push(2);
    expect(linkedList, equals([2, 1]));

    linkedList.push(3);
    expect(linkedList, equals([3, 2, 1]));
  });

  test(".pop is returning and removing first element", () {
    LinkedList<double> linkedList = new LinkedList();

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

  test(".pop is returning null when list is empty", () {
    LinkedList<double> linkedList = new LinkedList();

    expect(linkedList.pop(), isNull);
  });
}
