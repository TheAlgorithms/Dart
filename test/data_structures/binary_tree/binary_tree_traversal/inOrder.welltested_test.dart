import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../../../data_structures/binary_tree/binary_tree_traversal.dart';

import 'inOrder.welltested_test.mocks.dart';

@GenerateMocks([TreeNode])
void main() {
  group('inOrder', () {
    test('should return an empty list when the root is null', () {
      final root = MockTreeNode();
      when(root.value).thenReturn(null);
      when(root.left).thenReturn(null);
      when(root.right).thenReturn(null);

      final result = inOrder(root, []);

      expect(result, []);
    });

    test(
        'should return a list with a single element when the root has no children',
        () {
      final root = MockTreeNode();
      when(root.value).thenReturn(5);
      when(root.left).thenReturn(null);
      when(root.right).thenReturn(null);

      final result = inOrder(root, []);

      expect(result, [5]);
    });

    test(
        'should return a list with elements in the correct order for a balanced binary tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final right = MockTreeNode();
      when(root.value).thenReturn(5);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(right);
      when(left.value).thenReturn(3);
      when(left.left).thenReturn(null);
      when(left.right).thenReturn(null);
      when(right.value).thenReturn(7);
      when(right.left).thenReturn(null);
      when(right.right).thenReturn(null);

      final result = inOrder(root, []);

      expect(result, [3, 5, 7]);
    });

    test(
        'should return a list with elements in the correct order for an unbalanced binary tree',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final right = MockTreeNode();
      final leftLeft = MockTreeNode();
      when(root.value).thenReturn(5);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(right);
      when(left.value).thenReturn(3);
      when(left.left).thenReturn(leftLeft);
      when(left.right).thenReturn(null);
      when(leftLeft.value).thenReturn(1);
      when(leftLeft.left).thenReturn(null);
      when(leftLeft.right).thenReturn(null);
      when(right.value).thenReturn(7);
      when(right.left).thenReturn(null);
      when(right.right).thenReturn(null);

      final result = inOrder(root, []);

      expect(result, [1, 3, 5, 7]);
    });

    test(
        'should return a list with elements in the correct order for a binary tree with duplicate values',
        () {
      final root = MockTreeNode();
      final left = MockTreeNode();
      final right = MockTreeNode();
      when(root.value).thenReturn(5);
      when(root.left).thenReturn(left);
      when(root.right).thenReturn(right);
      when(left.value).thenReturn(5);
      when(left.left).thenReturn(null);
      when(left.right).thenReturn(null);
      when(right.value).thenReturn(7);
      when(right.left).thenReturn(null);
      when(right.right).thenReturn(null);

      final result = inOrder(root, []);

      expect(result, [5, 5, 7]);
    });
  });
}
