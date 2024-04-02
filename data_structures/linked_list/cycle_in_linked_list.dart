import 'dart:math';
import 'package:test/test.dart';

class Node {
  int value;
  Node? next = null;
  Node(this.value);

  int get nodeValue {
    return this.value;
  }

  Node? get nextNode {
    return this.next;
  }
}

class LinkedList {
  Node? _headNode;
  Node? _tailNode;

  Node? get head {
    return this._headNode;
  }

  Node? get tail {
    return this._tailNode;
  }

  void insert(Node? newNode) {
    if (head == null) {
      this._headNode = newNode;
      this._tailNode = newNode;
    } else {
      this._tailNode?.next = newNode;
      this._tailNode = this._tailNode?.next;
    }
  }
}

Node createNode(int value) {
  return Node(value);
}

Node? findCyclicNode(Node? headNode) {
  /// Check : https://en.wikipedia.org/wiki/Cycle_detection
  /// we maintain a fast and slow pointer
  /// The fast pointer jumps 2 nodes at a time
  /// and the slow pointer jumps one node at a time
  /// eventually the fast and slow will coincide on a node
  ///
  /// Then we place one of the node back to the head.
  /// The node where these two nodes coincide again will be the
  /// origin of the loop node.
  /// and move in tandem. check algorith for proof
  Node? fastNode = headNode;
  Node? slowNode = headNode;

  while (fastNode != null && fastNode.next != null) {
    slowNode = slowNode?.next;
    fastNode = fastNode.next?.next;

    if (slowNode == fastNode) {
      break;
    }
  }

  if (slowNode == fastNode) {
    slowNode = headNode;
    while (slowNode != fastNode) {
      slowNode = slowNode?.next;
      fastNode = fastNode?.next;
    }
    return slowNode;
  } else {
    return null;
  }
}

void main() {
  LinkedList linkedList = LinkedList();
  List<Node> allNodes = <Node>[];
  for (var i = 0; i <= 10; i++) {
    Node newNode = createNode(i);
    linkedList.insert(newNode);
    allNodes.add(newNode);
  }
  Node? tail = linkedList.tail;
  Random random = new Random();

  test(('test 1'), () {
    int randomIndex = random.nextInt(9);
    tail?.next = allNodes[randomIndex];
    Node? cycleNode = findCyclicNode(linkedList.head);
    expect(cycleNode, equals(allNodes[randomIndex]));
  });
  test(('test 2'), () {
    int randomIndex = random.nextInt(9);
    tail?.next = allNodes[randomIndex];
    Node? cycleNode = findCyclicNode(linkedList.head);
    expect(cycleNode, equals(allNodes[randomIndex]));
  });

  test(('test 3'), () {
    int randomIndex = random.nextInt(9);
    tail?.next = allNodes[randomIndex];
    Node? cycleNode = findCyclicNode(linkedList.head);
    expect(cycleNode, equals(allNodes[randomIndex]));
  });

  test(('test 4'), () {
    int randomIndex = random.nextInt(9);
    tail?.next = allNodes[randomIndex];
    Node? cycleNode = findCyclicNode(linkedList.head);
    expect(cycleNode, equals(allNodes[randomIndex]));
  });

  test(('test 5'), () {
    int randomIndex = random.nextInt(9);
    tail?.next = allNodes[randomIndex];
    Node? cycleNode = findCyclicNode(linkedList.head);
    expect(cycleNode, equals(allNodes[randomIndex]));
  });

  test(('test 6'), () {
    int randomIndex = random.nextInt(9);
    tail?.next = allNodes[randomIndex];
    Node? cycleNode = findCyclicNode(linkedList.head);
    expect(cycleNode, equals(allNodes[randomIndex]));
  });

  test(('test 7'), () {
    int randomIndex = random.nextInt(9);
    tail?.next = allNodes[randomIndex];
    Node? cycleNode = findCyclicNode(linkedList.head);
    expect(cycleNode, equals(allNodes[randomIndex]));
  });
}
