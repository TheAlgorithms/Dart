import 'dart:collection';

import 'package:test/test.dart';

class TreeNode {
  int data;
  TreeNode? leftNode = null;
  TreeNode? rightNode = null;

  int get value {
    return this.data;
  }

  TreeNode(this.data);
}

List<int> inOrder(TreeNode? root, List<int> result) {
  if (root != null) {
    inOrder(root.leftNode, result);
    result.add(root.value);
    inOrder(root.rightNode, result);
  }
  return result;
}

List<int> preOrder(TreeNode? root, List<int> result) {
  if (root != null) {
    result.add(root.value);
    preOrder(root.leftNode, result);
    preOrder(root.rightNode, result);
  }
  return result;
}

List<int> postOrder(TreeNode? root, List<int> result) {
  if (root != null) {
    postOrder(root.leftNode, result);
    postOrder(root.rightNode, result);
    result.add(root.value);
  }
  return result;
}

List<int> levelOrder(TreeNode? root, List<int> result) {
  if (root == null) {
    return result;
  }

  Queue<TreeNode?> q = Queue();
  q.add(root);

  while (q.isNotEmpty) {
    TreeNode? curr = q.removeFirst();
    if (curr != null) {
      result.add(curr.data);
      q.add(curr.leftNode);
      q.add(curr.rightNode);
    }
  }

  return result;
}

void main() {
  var root = TreeNode(1);
  root.leftNode = TreeNode(2);
  root.rightNode = TreeNode(3);
  root.leftNode!.leftNode = TreeNode(4);
  root.leftNode!.rightNode = TreeNode(5);
  root.leftNode!.rightNode!.leftNode = TreeNode(6);
  root.rightNode!.leftNode = TreeNode(7);
  root.rightNode!.leftNode!.leftNode = TreeNode(8);
  root.rightNode!.leftNode!.leftNode!.rightNode = TreeNode(9);

  List<int> result;

  test(('inOrder traversal'), () {
    result = inOrder(root, <int>[]);
    expect(result, equals([4, 2, 6, 5, 1, 8, 9, 7, 3]));
  });

  test(('preOrder traversal'), () {
    result = preOrder(root, <int>[]);
    expect(result, equals([1, 2, 4, 5, 6, 3, 7, 8, 9]));
  });

  test(('postOrder traversal'), () {
    result = postOrder(root, <int>[]);
    expect(result, equals([4, 6, 5, 2, 9, 8, 7, 3, 1]));
  });

  test(('levelOrder traversal'), () {
    // https://www.geeksforgeeks.org/level-order-tree-traversal/
    result = levelOrder(root, <int>[]);
    expect(result, equals([1, 2, 3, 4, 5, 7, 6, 8, 9]));
  });

  test(('postOrder traversal for null root'), () {
    result = postOrder(null, <int>[]);
    expect(result, equals([]));
  });

  test(('inOrder traversal for null root'), () {
    result = inOrder(null, <int>[]);
    expect(result, equals([]));
  });

  test(('preOrder traversal for null root'), () {
    result = preOrder(null, <int>[]);
    expect(result, equals([]));
  });

  test(('levelOrder traversal for null root'), () {
    result = levelOrder(null, <int>[]);
    expect(result, equals([]));
  });
}
