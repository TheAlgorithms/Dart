import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../../../data_structures/binary_tree/binary_tree_traversal.dart';

import 'postOrder.welltested_test.mocks.dart';

@GenerateMocks([TreeNode])
void main() {
  group('postOrder', () {
    test('should return an empty list when the tree is empty', () {
      final root = null;
      final result = postOrder(root, []);
      expect(result, []);
    });

    test(
        'should return a list with a single element when the tree has only one node',
        () {
      final root = MockTreeNode();
      when(root.value).thenReturn(1);
      when(root.left).thenReturn(null);
      when(root.right).thenReturn(null);

      final result = postOrder(root, []);
      expect(result, [1]);
    });

    test(
        'should return a list with post-order traversal of a balanced binary tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final right = MockTreeNode();

      when(root.value).thenReturn(1);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(right);

      when(left.value).thenReturn(2);
      when(left.left).thenReturn(null);
      when(left.right).thenReturn(null);

      when(right.value).thenReturn(3);
      when(right.left).thenReturn(null);
      when(right.right).thenReturn(null);

      final result = postOrder(root, []);
      expect(result, [2, 3, 1]);
    });

    test(
        'should return a list with post-order traversal of a left-skewed binary tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final leftLeft = MockTreeNode();

      when(root.value).thenReturn(1);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(null);

      when(left.value).thenReturn(2);
      when(left.left).thenReturn(leftLeft);
      when(left.right).thenReturn(null);

      when(leftLeft.value).thenReturn(3);
      when(leftLeft.left).thenReturn(null);
      when(leftLeft.right).thenReturn(null);

      final result = postOrder(root, []);
      expect(result, [3, 2, 1]);
    });

    test(
        'should return a list with post-order traversal of a right-skewed binary tree',
        () {
      final root = MockTreeNode();
      final right = MockTreeNode();
      final rightRight = MockTreeNode();

      when(root.value).thenReturn(1);
      when(root.left).thenReturn(null);
      when(root.right).thenReturn(right);

      when(right.value).thenReturn(2);
      when(right.left).thenReturn(null);
      when(right.right).thenReturn(rightRight);

      when(rightRight.value).thenReturn(3);
      when(rightRight.left).thenReturn(null);
      when(rightRight.right).thenReturn(null);

      final result = postOrder(root, []);
      expect(result, [3, 2, 1]);
    });
  });
}
