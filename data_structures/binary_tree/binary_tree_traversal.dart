import 'dart:collection';

import 'package:test/test.dart';

class TreeNode {
  int? data;
  TreeNode? leftNode = null;
  TreeNode? rightNode = null;

  int? get value {
    return this.data;
  }

  TreeNode? get left {
    return this.leftNode;
  }

  void set left(TreeNode? value) {
    this.leftNode = value;
  }

  void set right(TreeNode? value) {
    this.rightNode = value;
  }

  TreeNode? get right {
    return this.rightNode;
  }

  TreeNode(this.data);
}

List<int?> inOrder(TreeNode? root, List<int?> result) {
  if (root != null) {
    inOrder(root.left, result);
    result.add(root.value);
    inOrder(root.right, result);
  }
  return result;
}

List<int?> preOrder(TreeNode? root, List<int?> result) {
  if (root != null) {
    result.add(root.value);
    preOrder(root.left, result);
    preOrder(root.right, result);
  }
  return result;
}

List<int?> postOrder(TreeNode? root, List<int?> result) {
  if (root != null) {
    postOrder(root.left, result);
    postOrder(root.right, result);
    result.add(root.value);
  }
  return result;
}

List<int?> levelOrder(TreeNode? root, List<int?> result) {
  Queue<TreeNode?> q = Queue();
  if (root != null) {
    q.add(root);
  }

  while (!q.isEmpty) {
    TreeNode? curr = q.first;
    q.removeFirst();
    result.add(curr?.data);
    if (curr?.left != null) {
      q.addLast(curr?.left);
    }
    if (curr?.right != null) {
      q.addLast(curr?.right);
    }
  }

  return result;
}

void main() {
  TreeNode? root = TreeNode(1);
  root.left = TreeNode(2);
  root.right = TreeNode(3);
  root.left?.left = TreeNode(4);
  root.left?.right = TreeNode(5);
  root.left?.right?.left = TreeNode(6);
  root.right?.left = TreeNode(7);
  root.right?.left?.left = TreeNode(8);
  root.right?.left?.left?.right = TreeNode(9);

  List<int> result;
  result = List.empty(growable: true);

  test(('inOrder traversal'), () {
    result = List.empty(growable: true);
    expect(inOrder(root, result), equals([4, 2, 6, 5, 1, 8, 9, 7, 3]));
  });

  test(('preOrder traversal'), () {
    result = List.empty(growable: true);
    expect(preOrder(root, result), equals([1, 2, 4, 5, 6, 3, 7, 8, 9]));
  });

  test(('postOrder traversal'), () {
    result = List.empty(growable: true);
    expect(postOrder(root, result), equals([4, 6, 5, 2, 9, 8, 7, 3, 1]));
  });

  test(('levelOrder traversal'), () {
    // https://www.geeksforgeeks.org/level-order-tree-traversal/
    result = List.empty(growable: true);
    expect(levelOrder(root, result), equals([1, 2, 3, 4, 5, 7, 6, 8, 9]));
  });

  test(('postOrder traversal'), () {
    result = List.empty(growable: true);
    root = null;
    expect(postOrder(root, result), equals([]));
  });

  test(('inOrder traversal'), () {
    result = List.empty(growable: true);
    root = null;
    expect(inOrder(root, result), equals([]));
  });

  test(('preOrder traversal'), () {
    result = List.empty(growable: true);
    root = null;
    expect(preOrder(root, result), equals([]));
  });

  test(('levelOrder traversal'), () {
    result = List.empty(growable: true);
    root = null;
    expect(levelOrder(root, result), equals([]));
  });
}
