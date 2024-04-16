/**
 * Doubly Linked List
 */

/**
 * Node class
 */
class Node<T> {
  T data;
  Node<T> next;
  Node<T> prev;

  Node(this.data, [this.next, this.prev]);
}

/**
 * Doubly Linked List class
 */
class DoublyLinkedList<T> extends Iterator<T> {
  Node<T> _head;
  Node<T> _tail;
  int _length = 0;
  Node<T> _current;

  DoublyLinkedList() {
    this._head = null;
    this._tail = null;
    this._length = 0;
  }

  /**
   * Push
   */
  void push(T data) {
    Node<T> newNode = new Node(data);

    if (this._length == 0) {
      this._head = newNode;
      this._tail = newNode;
    } else {
      this._tail.next = newNode;
      newNode.prev = this._tail;
      this._tail = newNode;
    }

    this._length++;
  }

  /**
   * Pop
   */
  Node<T> pop() {
    if (this._length == 0) return null;

    Node<T> poppedNode = this._tail;

    if (this._length == 1) {
      this._head = null;
      this._tail = null;
    } else {
      this._tail = poppedNode.prev;
      this._tail.next = null;
      poppedNode.prev = null;
    }

    this._length--;

    return poppedNode;
  }

  /**
   * Shift
   */
  Node<T> shift() {
    if (this._length == 0) return null;

    Node<T> shiftedNode = this._head;

    if (this._length == 1) {
      this._head = null;
      this._tail = null;
    } else {
      this._head = shiftedNode.next;
      this._head.prev = null;
      shiftedNode.next = null;
    }

    this._length--;

    return shiftedNode;
  }

  /**
   * Unshift
   */
  void unshift(T data) {
    Node<T> newNode = new Node(data);

    if (this._length == 0) {
      this._head = newNode;
      this._tail = newNode;
    } else {
      this._head.prev = newNode;
      newNode.next = this._head;
      this._head = newNode;
    }

    this._length++;
  }

  /**
   * Get
   */
  Node<T> get(int index) {
    if (index < 0 || index >= this._length) return null;

    Node<T> current;
    int count;

    if (index <= this._length / 2) {
      count = 0;
      current = this._head;

      while (count != index) {
        current = current.next;
        count++;
      }
    } else {
      count = this._length - 1;
      current = this._tail;

      while (count != index) {
        current = current.prev;
        count--;
      }
    }

    return current;
  }

  /**
   * Set
   */
  bool set(int index, T data) {
    Node<T> foundNode = this.get(index);

    if (foundNode != null) {
      foundNode.data = data;
      return true;
    }

    return false;
  }

  /**
   * Insert
   */
  bool insert(int index, T data) {
    if (index < 0 || index > this._length) return false;

    if (index == 0) {
      this.unshift(data);
      return true;
    }

    if (index == this._length) {
      this.push(data);
      return true;
    }

    Node<T> newNode = new Node(data);
    Node<T> beforeNode = this.get(index - 1);
    Node<T> afterNode = beforeNode.next;

    beforeNode.next = newNode;
    newNode.prev = beforeNode;
    newNode.next = afterNode;
    afterNode.prev = newNode;

    this._length++;

    return true;
  }

  /**
   * Remove
   */
  Node<T> remove(int index) {
    if (index < 0 || index >= this._length) return null;

    if (index == 0) return this.shift();

    if (index == this._length - 1) return this.pop();

    Node<T> removedNode = this.get(index);
    Node<T> beforeNode = removedNode.prev;
    Node<T> afterNode = removedNode.next;

    beforeNode.next = afterNode;
    afterNode.prev = beforeNode;
    removedNode.next = null;
    removedNode.prev = null;

    this._length--;

    return removedNode;
  }

  /**
   * Reverse
   */
  void reverse() {
    Node<T> temp = this._head;
    this._head = this._tail;
    this._tail = temp;

    Node<T> next;
    Node<T> prev = null;

    for (int i = 0; i < this._length; i++) {
      next = temp.next;
      temp.next = prev;
      temp.prev = next;
      prev = temp;
      temp = next;
    }
  }

  /**
   * Iterator
   */
  bool moveNext() {
    if (this._current == null) {
      this._current = this._head;
    } else {
      this._current = this._current.next;
    }

    return this._current != null;
  }

  T get current => this._current?.data;

  /**
   * Iterable
   */
  Iterator<T> get iterator => this;

  /**
   * Length
   */
  int get length => this._length;

  /**
   * Head
   */
  Node<T> get head => this._head;

  /**
   * Tail
   */
  Node<T> get tail => this._tail;

  /**
   * Print
   */
  void printList() {
    List<T> list = [];

    Node<T> currentNode = this._head;

    while (currentNode != null) {
      list.add(currentNode.data);
      currentNode = currentNode.next;
    }

    print(list);
  }

  /**
   * Print reverse
   */
  void printListReverse() {
    List<T> list = [];

    Node<T> currentNode = this._tail;

    while (currentNode != null) {
      list.add(currentNode.data);
      currentNode = currentNode.prev;
    }

    print(list);
  }

  /**
   * Clear
   */
  void clear() {
    this._head = null;
    this._tail = null;
    this._length = 0;
  }

  /**
   * Search
   */
  int search(T data) {
    Node<T> currentNode = this._head;
    int index = 0;

    while (currentNode != null) {
      if (currentNode.data == data) return index;

      currentNode = currentNode.next;
      index++;
    }

    return -1;
  }

  /**
   * Contains
   */
  bool contains(T data) {
    return this.search(data) != -1;
  }

  /**
   * Is empty
   */
  bool get isEmpty => this._length == 0;

  /**
   * To List
   */
  List<T> toList() {
    List<T> list = [];

    Node<T> currentNode = this._head;

    while (currentNode != null) {
      list.add(currentNode.data);
      currentNode = currentNode.next;
    }

    return list;
  }

  /**
   * To String
   */
  String toString() {
    return this.toList().toString();
  }
}
