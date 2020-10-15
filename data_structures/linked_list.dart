class Node<T> {
  Node<T> next;
  T value;

  Node(this.value);
  Node.before(this.next, this.value);
}

class LinkedListIterator<T> extends Iterator<T> {
  Node<T> _current;

  @override
  bool moveNext() => _current != null;

  @override
  T get current {
    T currentValue = this._current.value;

    this._current = this._current.next;

    return currentValue;
  }

  LinkedListIterator(this._current);
}

class LinkedList<T> extends Iterable<T> {
  int _length = 0;
  int get length => this._length;

  Node<T> _head;

  @override
  Iterator<T> get iterator => new LinkedListIterator<T>(this._head);

  void remove(T item) {
    if (this._head?.value == item) {
      this._head = this._head?.next;
      this._length--;
    }

    if (this._head != null) {
      Node<T> current = this._head;
      while (current?.next != null) {
        if (current.next.value == item) {
          current.next = current.next.next;
          this._length--;
        }

        current = current.next;
      }
    }
  }

  T pop() {
    if (this._head != null) {
      T value = this._head.value;
      this._head = this._head.next;
      this._length--;

      return value;
    }

    return null;
  }

  void push(T item) {
    this._head = new Node.before(this._head, item);
    this._length++;
  }

  void add(T item) {
    if (this._head == null) {
      this._head = new Node(item);
    } else {
      Node<T> current = this._head;
      while (current?.next != null) {
        current = current.next;
      }

      current.next = Node(item);
    }
    this._length++;
  }
}

main(List<String> args) {
  LinkedList<double> linkedList = new LinkedList();
  linkedList.add(2);
  linkedList.add(4);
  linkedList.add(6);
  linkedList.add(8);

  print(linkedList.join(", ") + " size=${linkedList.length}");
  linkedList.remove(6);
  print(linkedList.join(", ") + " size=${linkedList.length}");
  linkedList.remove(2);
  print("5 in linkedList - ${linkedList.contains(5)}");
  print("4 in linkedList - ${linkedList.contains(4)}");
  print(linkedList.join(", ") + " size=${linkedList.length}");
  linkedList.remove(8);
  print(linkedList.join(", ") + " size=${linkedList.length}");
  linkedList.remove(4);
  print(linkedList.join(", ") + " size=${linkedList.length}");

  LinkedList<double> stack = new LinkedList();
  stack.push(2);
  stack.push(4);
  stack.push(6);

  print(stack.join(", ") + " size=${stack.length}");
  stack.pop();
  print(stack.join(", ") + " size=${stack.length}");
  stack.pop();
  stack.pop();
  stack.pop();
  print(stack.join(", ") + " size=${stack.length}");
}
