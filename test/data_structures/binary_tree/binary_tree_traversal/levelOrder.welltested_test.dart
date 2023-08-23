import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../../../data_structures/binary_tree/binary_tree_traversal.dart';

import 'levelOrder.welltested_test.mocks.dart';

@GenerateMocks([TreeNode])
void main() {
  group('levelOrder', () {
    test('should return an empty list when the root is null', () {
      final result = levelOrder(null, []);
      expect(result, []);
    });

    test(
        'should return a list with a single element when the root has no children',
        () {
      final root = MockTreeNode();
      when(root.data).thenReturn(1);
      when(root.left).thenReturn(null);
      when(root.right).thenReturn(null);

      final result = levelOrder(root, []);
      expect(result, [1]);
    });

    test(
        'should return a list with level order traversal for a balanced binary tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final right = MockTreeNode();
      final leftLeft = MockTreeNode();
      final leftRight = MockTreeNode();
      final rightLeft = MockTreeNode();
      final rightRight = MockTreeNode();

      when(root.data).thenReturn(1);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(right);

      when(left.data).thenReturn(2);
      when(left.left).thenReturn(leftLeft);
      when(left.right).thenReturn(leftRight);

      when(right.data).thenReturn(3);
      when(right.left).thenReturn(rightLeft);
      when(right.right).thenReturn(rightRight);

      when(leftLeft.data).thenReturn(4);
      when(leftLeft.left).thenReturn(null);
      when(leftLeft.right).thenReturn(null);

      when(leftRight.data).thenReturn(5);
      when(leftRight.left).thenReturn(null);
      when(leftRight.right).thenReturn(null);

      when(rightLeft.data).thenReturn(6);
      when(rightLeft.left).thenReturn(null);
      when(rightLeft.right).thenReturn(null);

      when(rightRight.data).thenReturn(7);
      when(rightRight.left).thenReturn(null);
      when(rightRight.right).thenReturn(null);

      final result = levelOrder(root, []);
      expect(result, [1, 2, 3, 4, 5, 6, 7]);
    });

    test(
        'should return a list with level order traversal for an unbalanced binary tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final right = MockTreeNode();
      final leftLeft = MockTreeNode();
      final leftRight = MockTreeNode();

      when(root.data).thenReturn(1);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(right);

      when(left.data).thenReturn(2);
      when(left.left).thenReturn(leftLeft);
      when(left.right).thenReturn(leftRight);

      when(right.data).thenReturn(3);
      when(right.left).thenReturn(null);
      when(right.right).thenReturn(null);

      when(leftLeft.data).thenReturn(4);
      when(leftLeft.left).thenReturn(null);
      when(leftLeft.right).thenReturn(null);

      when(leftRight.data).thenReturn(5);
      when(leftRight.left).thenReturn(null);
      when(leftRight.right).thenReturn(null);

      final result = levelOrder(root, []);
      expect(result, [1, 2, 3, 4, 5]);
    });
  });
}
