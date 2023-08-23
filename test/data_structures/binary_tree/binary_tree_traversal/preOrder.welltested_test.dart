import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../../../data_structures/binary_tree/binary_tree_traversal.dart';

import 'preOrder.welltested_test.mocks.dart';

@GenerateMocks([TreeNode])
void main() {
  group('preOrder', () {
    test('should return an empty list when the tree is empty', () {
      final root = MockTreeNode();
      when(root.value).thenReturn(null);

      final result = preOrder(root, []);

      expect(result, []);
    });

    test(
        'should return a list with a single element when the tree has only one node',
        () {
      final root = MockTreeNode();
      when(root.value).thenReturn(1);
      when(root.left).thenReturn(null);
      when(root.right).thenReturn(null);

      final result = preOrder(root, []);

      expect(result, [1]);
    });

    test('should return a list with pre-order traversal for a balanced tree',
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

      final result = preOrder(root, []);

      expect(result, [1, 2, 3]);
    });

    test('should return a list with pre-order traversal for a left-skewed tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      when(root.value).thenReturn(1);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(null);
      when(left.value).thenReturn(2);
      when(left.left).thenReturn(null);
      when(left.right).thenReturn(null);

      final result = preOrder(root, []);

      expect(result, [1, 2]);
    });

    test(
        'should return a list with pre-order traversal for a right-skewed tree',
        () {
      final root = MockTreeNode();
      final right = MockTreeNode();
      when(root.value).thenReturn(1);
      when(root.left).thenReturn(null);
      when(root.right).thenReturn(right);
      when(right.value).thenReturn(2);
      when(right.left).thenReturn(null);
      when(right.right).thenReturn(null);

      final result = preOrder(root, []);

      expect(result, [1, 2]);
    });

    test('should return a list with pre-order traversal for a complex tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final right = MockTreeNode();
      final leftLeft = MockTreeNode();
      final leftRight = MockTreeNode();
      final rightLeft = MockTreeNode();
      final rightRight = MockTreeNode();
      when(root.value).thenReturn(1);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(right);
      when(left.value).thenReturn(2);
      when(left.left).thenReturn(leftLeft);
      when(left.right).thenReturn(leftRight);
      when(right.value).thenReturn(3);
      when(right.left).thenReturn(rightLeft);
      when(right.right).thenReturn(rightRight);
      when(leftLeft.value).thenReturn(4);
      when(leftLeft.left).thenReturn(null);
      when(leftLeft.right).thenReturn(null);
      when(leftRight.value).thenReturn(5);
      when(leftRight.left).thenReturn(null);
      when(leftRight.right).thenReturn(null);
      when(rightLeft.value).thenReturn(6);
      when(rightLeft.left).thenReturn(null);
      when(rightLeft.right).thenReturn(null);
      when(rightRight.value).thenReturn(7);
      when(rightRight.left).thenReturn(null);
      when(rightRight.right).thenReturn(null);

      final result = preOrder(root, []);

      expect(result, [1, 2, 4, 5, 3, 6, 7]);
    });
  });
}
