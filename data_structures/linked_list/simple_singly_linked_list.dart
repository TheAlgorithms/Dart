class Node {
  int value;
  Node next = null;
  Node(this.value);

  int get nodeValue {
    return this.value;
  }
}

class LinkedList {
  Node _headNode;
  Node _tailNode;

  Node get head {
    return this._headNode;
  }

  void insert(int value) {
    Node newNode = Node(value);

    if (this._headNode == null) {
      this._headNode = newNode;
      this._tailNode = newNode;
    } else {
      this._tailNode.next = newNode;
      this._tailNode = this._tailNode.next;
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
    print('${node.nodeValue}');
    node = node.next;
  }
}
