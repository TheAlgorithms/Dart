import 'package:test/test.dart';

import 'is_full_binary_tree.welltested_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../data_structures/binary_tree/basic_binary_tree.dart';

@GenerateMocks([Node])
void main() {
  group('is_full_binary_tree', () {
    test('should return true for an empty tree', () {
      expect(is_full_binary_tree(null), true);
    });

    test('should return true for a tree with only one node', () {
      final node = MockNode();
      when(node.left).thenReturn(null);
      when(node.right).thenReturn(null);

      expect(is_full_binary_tree(node), true);
    });

    test('should return true for a full binary tree', () {
      final node = MockNode();
      final leftChild = MockNode();
      final rightChild = MockNode();

      when(node.left).thenReturn(leftChild);
      when(node.right).thenReturn(rightChild);
      when(leftChild.left).thenReturn(null);
      when(leftChild.right).thenReturn(null);
      when(rightChild.left).thenReturn(null);
      when(rightChild.right).thenReturn(null);

      expect(is_full_binary_tree(node), true);
    });

    test('should return false for a non-full binary tree', () {
      final node = MockNode();
      final leftChild = MockNode();
      final rightChild = MockNode();

      when(node.left).thenReturn(leftChild);
      when(node.right).thenReturn(rightChild);
      when(leftChild.left).thenReturn(null);
      when(leftChild.right).thenReturn(null);
      when(rightChild.left).thenReturn(MockNode());
      when(rightChild.right).thenReturn(null);

      expect(is_full_binary_tree(node), false);
    });

    test('should return false for a tree with only left child', () {
      final node = MockNode();
      final leftChild = MockNode();

      when(node.left).thenReturn(leftChild);
      when(node.right).thenReturn(null);
      when(leftChild.left).thenReturn(null);
      when(leftChild.right).thenReturn(null);

      expect(is_full_binary_tree(node), false);
    });

    test('should return false for a tree with only right child', () {
      final node = MockNode();
      final rightChild = MockNode();

      when(node.left).thenReturn(null);
      when(node.right).thenReturn(rightChild);
      when(rightChild.left).thenReturn(null);
      when(rightChild.right).thenReturn(null);

      expect(is_full_binary_tree(node), false);
    });
  });
}
