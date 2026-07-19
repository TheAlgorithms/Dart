import 'package:test/test.dart';
import '../../data_structures/linked_list/doubly_linked_list.dart';

class CustomClass {
  int value;

  CustomClass(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomClass &&
          runtimeType == other.runtimeType &&
          value == other.value;

  String toString() {
    return this.value.toString();
  }
}

void main() {
  group("Doubly Linked List Tests", () {
    test("Push", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);

      expect(list.length, 1);
      expect(list.head.data, 1);
      expect(list.tail.data, 1);

      list.push(2);

      expect(list.length, 2);
      expect(list.head.data, 1);
      expect(list.tail.data, 2);

      list.push(3);

      expect(list.length, 3);
      expect(list.head.data, 1);
      expect(list.tail.data, 3);
    });

    test("Pop", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);

      expect(list.length, 3);
      expect(list.head.data, 1);
      expect(list.tail.data, 3);

      Node poppedNode = list.pop();

      expect(list.length, 2);
      expect(list.head.data, 1);
      expect(list.tail.data, 2);
      expect(poppedNode.data, 3);

      poppedNode = list.pop();

      expect(list.length, 1);
      expect(list.head.data, 1);
      expect(list.tail.data, 1);
      expect(poppedNode.data, 2);

      poppedNode = list.pop();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(poppedNode.data, 1);

      poppedNode = list.pop();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(poppedNode, null);
    });

    test("Shift", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);

      expect(list.length, 3);
      expect(list.head.data, 1);
      expect(list.tail.data, 3);

      Node shiftedNode = list.shift();

      expect(list.length, 2);
      expect(list.head.data, 2);
      expect(list.tail.data, 3);
      expect(shiftedNode.data, 1);

      shiftedNode = list.shift();

      expect(list.length, 1);
      expect(list.head.data, 3);
      expect(list.tail.data, 3);
      expect(shiftedNode.data, 2);

      shiftedNode = list.shift();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(shiftedNode.data, 3);

      shiftedNode = list.shift();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(shiftedNode, null);
    });

    test("Unshift", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.unshift(1);

      expect(list.length, 1);
      expect(list.head.data, 1);
      expect(list.tail.data, 1);

      list.unshift(2);

      expect(list.length, 2);
      expect(list.head.data, 2);
      expect(list.tail.data, 1);

      list.unshift(3);

      expect(list.length, 3);
      expect(list.head.data, 3);
      expect(list.tail.data, 1);
    });

    test("Get", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);

      expect(list.length, 3);
      expect(list.head.data, 1);
      expect(list.tail.data, 3);

      Node node = list.get(0);

      expect(node.data, 1);

      node = list.get(1);

      expect(node.data, 2);

      node = list.get(2);

      expect(node.data, 3);

      node = list.get(3);

      expect(node, null);

      node = list.get(-1);

      expect(node, null);
    });

    test("Set", () {
      bool result;
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);

      expect(list.length, 3);
      expect(list.head.data, 1);
      expect(list.tail.data, 3);

      result = list.set(0, 4);
      expect(result, true);
      expect(list.head.data, 4);

      result = list.set(1, 5);
      expect(result, true);
      expect(list.head.next.data, 5);

      result = list.set(2, 6);
      expect(result, true);
      expect(list.tail.data, 6);
    });

    test("Insert", () {
      bool result;
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      result = list.insert(0, 1);
      expect(result, true);
      expect(list.length, 1);
      expect(list.head.data, 1);
      expect(list.tail.data, 1);

      result = list.insert(1, 2);
      expect(result, true);
      expect(list.length, 2);
      expect(list.head.data, 1);
      expect(list.tail.data, 2);

      result = list.insert(1, 3);
      expect(result, true);
      expect(list.length, 3);
      expect(list.head.data, 1);
      expect(list.head.next.data, 3);

      result = list.insert(3, 4);
      expect(result, true);
      expect(list.length, 4);
      expect(list.head.data, 1);
      expect(list.tail.data, 4);

      result = list.insert(5, 5);
      expect(result, false);
      expect(list.length, 4);
      expect(list.head.data, 1);
      expect(list.tail.data, 4);

      result = list.insert(-1, 6);
      expect(result, false);
      expect(list.length, 4);
      expect(list.head.data, 1);
      expect(list.tail.data, 4);

      result = list.insert(0, 7);
      expect(result, true);
      expect(list.length, 5);
      expect(list.head.data, 7);
      expect(list.tail.data, 4);
    });

    test("Remove", () {
      Node removedNode;
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      removedNode = list.remove(0);
      expect(removedNode, null);
      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);
      removedNode = list.remove(0);
      expect(removedNode.data, 1);
      expect(list.length, 3);
      expect(list.head.data, 2);
      expect(list.tail.data, 4);

      list.push(1);
      removedNode = list.remove(2);
      expect(removedNode.data, 4);
      expect(list.length, 3);
      expect(list.head.data, 2);
      expect(list.tail.data, 1);

      removedNode = list.remove(1);
      expect(removedNode.data, 3);
      expect(list.length, 2);
      expect(list.head.data, 2);
      expect(list.tail.data, 1);

      removedNode = list.remove(1);
      expect(removedNode.data, 1);
      expect(list.length, 1);
      expect(list.head.data, 2);
      expect(list.tail.data, 2);

      removedNode = list.remove(0);
      expect(removedNode.data, 2);
      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
    });

    test("Reverse", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.length, 4);
      expect(list.head.data, 1);
      expect(list.tail.data, 4);

      list.reverse();

      expect(list.length, 4);
      expect(list.head.data, 4);
      expect(list.tail.data, 1);
    });

    test("Iterator", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(list.current, null);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.length, 4);
      expect(list.head.data, 1);
      expect(list.tail.data, 4);
      expect(list.current, null);

      list.moveNext();

      expect(list.current, 1);

      list.moveNext();

      expect(list.current, 2);

      list.moveNext();

      expect(list.current, 3);

      list.moveNext();

      expect(list.current, 4);

      list.moveNext();

      expect(list.current, null);
    });

    test("Length", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.length, 4);

      list.pop();

      expect(list.length, 3);

      list.shift();

      expect(list.length, 2);

      list.unshift(1);

      expect(list.length, 3);

      list.insert(1, 2);

      expect(list.length, 4);

      list.remove(1);

      expect(list.length, 3);

      list.reverse();

      expect(list.length, 3);
    });

    test("Head", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.head, null);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.head.data, 1);

      list.pop();

      expect(list.head.data, 1);

      list.shift();

      expect(list.head.data, 2);

      list.unshift(1);

      expect(list.head.data, 1);

      list.insert(1, 2);

      expect(list.head.data, 1);

      list.remove(1);

      expect(list.head.data, 1);

      list.reverse();

      expect(list.head.data, 3);
    });

    test("Tail", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.tail.data, 4);

      list.pop();

      expect(list.tail.data, 3);

      list.shift();

      expect(list.tail.data, 3);

      list.unshift(1);

      expect(list.tail.data, 3);

      list.insert(1, 2);

      expect(list.tail.data, 3);

      list.remove(1);

      expect(list.tail.data, 3);

      list.reverse();

      expect(list.tail.data, 1);
    });

    test("Clear", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.length, 4);
      expect(list.head.data, 1);
      expect(list.tail.data, 4);

      list.clear();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
    });

    test("Search", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.search(1), -1);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.search(1), 0);
      expect(list.search(2), 1);
      expect(list.search(3), 2);
      expect(list.search(4), 3);
      expect(list.search(5), -1);
    });

    test("Contains", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.contains(1), false);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.contains(1), true);
      expect(list.contains(2), true);
      expect(list.contains(3), true);
      expect(list.contains(4), true);
      expect(list.contains(5), false);
    });

    test("IsEmpty", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.isEmpty, true);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.isEmpty, false);
    });

    test("ToList", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.toList(), []);

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.toList(), [1, 2, 3, 4]);
    });

    test("ToString", () {
      DoublyLinkedList<double> list = new DoublyLinkedList();

      expect(list.toString(), "[]");

      list.push(1);
      list.push(2);
      list.push(3);
      list.push(4);

      expect(list.toString(), "[1.0, 2.0, 3.0, 4.0]");
    });

    test("Different Data Type - String", () {
      DoublyLinkedList<String> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(list.current, null);

      list.push("1");
      list.push("2");
      list.push("3");
      list.push("4");

      expect(list.length, 4);
      expect(list.head.data, "1");
      expect(list.tail.data, "4");
      expect(list.current, null);

      list.moveNext();

      expect(list.current, "1");

      list.moveNext();

      expect(list.current, "2");

      list.moveNext();

      expect(list.current, "3");

      list.moveNext();

      expect(list.current, "4");

      list.moveNext();

      expect(list.current, null);
    });

    test("Different Data Type - Object", () {
      DoublyLinkedList<Object> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(list.current, null);

      list.push(new Object());
      list.push(new Object());
      list.push(new Object());
      list.push(new Object());

      expect(list.length, 4);
      expect(list.head.data, isNotNull);
      expect(list.tail.data, isNotNull);
      expect(list.current, null);

      list.moveNext();

      expect(list.current, isNotNull);

      list.moveNext();

      expect(list.current, isNotNull);

      list.moveNext();

      expect(list.current, isNotNull);

      list.moveNext();

      expect(list.current, isNotNull);

      list.moveNext();

      expect(list.current, null);
    });

    test("Different Data Type - Custom Class", () {
      DoublyLinkedList<CustomClass> list = new DoublyLinkedList();

      expect(list.length, 0);
      expect(list.head, null);
      expect(list.tail, null);
      expect(list.current, null);

      list.push(new CustomClass(1));
      list.push(new CustomClass(2));
      list.push(new CustomClass(3));
      list.push(new CustomClass(4));

      expect(list.length, 4);
      expect(list.head.data, new CustomClass(1));
      expect(list.tail.data, new CustomClass(4));
      expect(list.current, null);

      list.moveNext();

      expect(list.current, new CustomClass(1));

      list.moveNext();

      expect(list.current, new CustomClass(2));

      list.moveNext();

      expect(list.current, new CustomClass(3));

      list.moveNext();

      expect(list.current, new CustomClass(4));

      list.moveNext();

      expect(list.current, null);
    });
  });
}
