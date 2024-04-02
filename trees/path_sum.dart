import 'package:test/test.dart';

// Question URL: https://leetcode.com/problems/path-sum/description/
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

bool isLeaf(TreeNode node) {
  if (node.left == null && node.right == null) {
    return true;
  }
  return false;
}

bool traverse(TreeNode? node, int targetSum, int runningSum) {
  if (node == null) {
    return false;
  }
  runningSum += node.val;
  if (isLeaf(node) && runningSum == targetSum) {
    return true;
  }

  bool hasPathSumInLeftTree = traverse(node.left, targetSum, runningSum);
  bool hasPathSumInRightTree = traverse(node.right, targetSum, runningSum);
  return hasPathSumInLeftTree || hasPathSumInRightTree;
}

bool hasPathSum(TreeNode root, int targetSum) {
  return traverse(root, targetSum, 0);
}

void main() {
  TreeNode root = TreeNode(
    5,
    TreeNode(
      4,
      TreeNode(
        11,
        TreeNode(7),
        TreeNode(2),
      ),
    ),
    TreeNode(
      8,
      TreeNode(13),
      TreeNode(
        4,
        null,
        TreeNode(1),
      ),
    ),
  );

  test('Test Case 1: true case', () {
    expect(hasPathSum(root, 22), true);
  });
  test('Test Case 2: false case', () {
    expect(hasPathSum(root, 222), false);
  });
}
