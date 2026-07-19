import 'package:test/test.dart';

class SortedLinkedList {
  Node? _head;
  Node? _tail;

  SortedLinkedList() {
    _head = null;
    _tail = null;
  }

  /// Inserts a new element into the sorted linked list.
  void insert(int value) {
    Node newNode = Node(value);
    if (_head == null) {
      _head = newNode;
      _tail = newNode;
    } else if (value < _head!.value) {
      newNode.next = _head;
      _head = newNode;
    } else if (value > _tail!.value) {
      _tail!.next = newNode;
      _tail = newNode;
    } else {
      Node? temp = _head;
      while (temp!.next != null && temp.next!.value < value) {
        temp = temp.next;
      }
      newNode.next = temp.next;
      temp.next = newNode;
      if (newNode.next == null) {
        _tail = newNode;
      }
    }
  }

  /// Displays the elements of the sorted linked list.
  void display() {
    print(toString());
  }

  /// Deletes the first occurrence of the specified element in the sorted linked list.
  bool delete(int value) {
    if (_head == null) {
      return false;
    } else if (_head!.value == value) {
      if (_head!.next == null) {
        _head = null;
        _tail = null;
      } else {
        _head = _head!.next;
      }
      return true;
    } else {
      Node? temp = _head;
      while (temp!.next != null) {
        if (temp.next!.value == value) {
          if (temp.next == _tail) {
            _tail = temp;
          }
          temp.next = temp.next!.next;
          return true;
        }
        temp = temp.next;
      }
      return false;
    }
  }

  /// Searches for the specified element in the sorted linked list.
  bool search(int value) {
    Node? temp = _head;
    while (temp != null) {
      if (temp.value == value) {
        return true;
      }
      temp = temp.next;
    }
    return false;
  }

  /// Checks if the sorted linked list is empty.
  bool isEmpty() {
    return _head == null;
  }

  /// Returns a string representation of the sorted linked list.
  @override
  String toString() {
    if (_head != null) {
      List<String> elements = [];
      Node? temp = _head;
      while (temp != null) {
        elements.add(temp.value.toString());
        temp = temp.next;
      }
      return '[${elements.join(', ')}]';
    } else {
      return '[]';
    }
  }
}

class Node {
  final int value;
  Node? next;

  Node(this.value) {
    next = null;
  }
}

void main() {
  group('SortedLinkedList', () {
    test('insert adds elements in sorted order', () {
      final list = SortedLinkedList();
      list.insert(3);
      list.insert(1);
      list.insert(2);

      expect(list.toString(), equals('[1, 2, 3]'));
    });

    test('delete removes an element from the list', () {
      final list = SortedLinkedList();
      list.insert(1);
      list.insert(2);
      list.insert(3);

      final result = list.delete(2);

      expect(result, equals(true));
      expect(list.toString(), equals('[1, 3]'));
    });

    test('delete returns false for non-existent element', () {
      final list = SortedLinkedList();
      list.insert(1);
      list.insert(2);
      list.insert(3);

      final result = list.delete(4);

      expect(result, equals(false));
      expect(list.toString(), equals('[1, 2, 3]'));
    });

    test('isEmpty returns true for an empty list', () {
      final list = SortedLinkedList();

      expect(list.isEmpty(), equals(true));
    });

    test('isEmpty returns false when the list has elements', () {
      final list = SortedLinkedList();
      list.insert(1);

      expect(list.isEmpty(), equals(false));
    });

    test('search finds an element in the list', () {
      final list = SortedLinkedList();
      list.insert(1);
      list.insert(2);
      list.insert(3);

      final result = list.search(2);

      expect(result, equals(true));
    });

    test('search returns false for an element not in the list', () {
      final list = SortedLinkedList();
      list.insert(1);
      list.insert(2);
      list.insert(3);

      final result = list.search(4);

      expect(result, equals(false));
    });
  });
}