import 'package:test/test.dart';

class TreeNode {
  int data;
  TreeNode? leftNode;
  TreeNode? rightNode;

  int get value {
    return data;
  }

  TreeNode? get left {
    return leftNode;
  }

  set left(TreeNode? value) {
    leftNode = value;
  }

  set right(TreeNode? value) {
    rightNode = value;
  }

  TreeNode? get right {
    return rightNode;
  }

  TreeNode(this.data);
}

List<int> inOrder(TreeNode? root, List<int> result) {
  if (root != null) {
    inOrder(root.left, result);
    result.add(root.value);
    inOrder(root.right, result);
  }
  return result;
}

List<int> preOrder(TreeNode? root, List<int> result) {
  if (root != null) {
    result.add(root.value);
    preOrder(root.left, result);
    preOrder(root.right, result);
  }
  return result;
}

List<int> postOrder(TreeNode? root, List<int> result) {
  if (root != null) {
    postOrder(root.left, result);
    postOrder(root.right, result);
    result.add(root.value);
  }
  return result;
}

void main() {
  TreeNode? root = TreeNode(1);
  root.left = TreeNode(2);
  root.right = TreeNode(3);
  root.left!.left = TreeNode(4);
  root.left!.right = TreeNode(5);
  root.left!.right!.left = TreeNode(6);
  root.right!.left = TreeNode(7);
  root.right!.left!.left = TreeNode(8);
  root.right!.left!.left!.right = TreeNode(9);

  List<int> result;
  result = [];

  test(('inOrder traversal'), () {
    result = [];
    expect(inOrder(root, result), equals([4, 2, 6, 5, 1, 8, 9, 7, 3]));
  });

  test(('preOrder traversal'), () {
    result = [];
    expect(preOrder(root, result), equals([1, 2, 4, 5, 6, 3, 7, 8, 9]));
  });

  test(('postOrder traversal'), () {
    result = [];
    expect(postOrder(root, result), equals([4, 6, 5, 2, 9, 8, 7, 3, 1]));
  });

  test(('postOrder traversal'), () {
    result = [];
    root = null;
    expect(postOrder(root, result), equals([]));
  });

  test(('inOrder traversal'), () {
    result = [];
    root = null;
    expect(inOrder(root, result), equals([]));
  });

  test(('preOrder traversal'), () {
    result = [];
    root = null;
    expect(preOrder(root, result), equals([]));
  });
}
