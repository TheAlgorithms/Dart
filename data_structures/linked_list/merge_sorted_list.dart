// https://leetcode.com/problems/merge-two-sorted-lists/
import 'package:test/test.dart';

class ListNode {
  int? val;
  ListNode? next;
  ListNode({this.val = 0, this.next});
}

extension PrintLinkedList on ListNode? {
  void printLinkedList() {
    ListNode? node = this;
    while (node != null) {
      print(node.val);
      node = node.next;
    }
  }

  List<int?> listValues() {
    List<int?> values = [];
    ListNode? node = this;
    while (node != null) {
      values.add(node.val);
      node = node.next;
    }
    return values;
  }
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  if (list1 == null) {
    return list2;
  } else if (list2 == null) {
    return list1;
  }
  ListNode head = list1;

  if ((list1.val ?? 0) < (list2.val ?? 0)) {
    head = list1;
    list1 = list1.next;
  } else {
    head = list2;
    list2 = list2.next;
  }

  ListNode? node = head;

  while (list1 != null || list2 != null) {
    if (list1 != null && list2 != null) {
      if ((list1.val ?? 0) < (list2.val ?? 0)) {
        node?.next = list1;
        list1 = list1.next;
      } else {
        node?.next = list2;
        list2 = list2.next;
      }
    } else if (list1 != null) {
      node?.next = list1;
      list1 = list1.next;
    } else {
      node?.next = list2;
      list2 = list2?.next;
    }

    node = node?.next;
  }
  return head;
}

void main() {
  test('test case 1', () {
    ListNode head1 =
        ListNode(val: 1, next: ListNode(val: 2, next: ListNode(val: 4)));
    ListNode head2 =
        ListNode(val: 1, next: ListNode(val: 3, next: ListNode(val: 4)));
    expect(mergeTwoLists(head1, head2).listValues(), [1, 1, 2, 3, 4, 4]);
  });

  test('test case 2', () {
    ListNode head1 =
        ListNode(val: 1, next: ListNode(val: 2, next: ListNode(val: 3)));
    ListNode head2 =
        ListNode(val: 4, next: ListNode(val: 5, next: ListNode(val: 6)));
    expect(mergeTwoLists(head1, head2).listValues(), [1, 2, 3, 4, 5, 6]);
  });
}
