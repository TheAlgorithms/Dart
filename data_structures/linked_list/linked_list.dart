class Node {
  int value;
  Node next = null;
  Node(this.value);
}

class LinkedList {
  Node head;
  Node tail;

  Node getHead() {
    return this.head;
  }

  void insert(int value) {
    Node newNode = Node(value);

    if (this.head == null) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      this.tail.next = newNode;
      this.tail = this.tail.next;
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList();

  for (var i = 0; i < 10; i++) {
    linkedList.insert(i);
  }
  Node head = linkedList.head;
  Node node = head;
  while (node != null) {
    print('${node.value}');
    node = node.next;
  }
}
