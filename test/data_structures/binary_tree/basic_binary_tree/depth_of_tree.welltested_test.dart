import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../../../data_structures/binary_tree/basic_binary_tree.dart';

import 'depth_of_tree.welltested_test.mocks.dart';

@GenerateMocks([Node])
void main() {
  group('depth_of_tree', () {
    test('should return 0 for null tree', () {
      expect(depth_of_tree(null), 0);
    });

    test('should return 1 for tree with only root node', () {
      final rootNode = MockNode();
      when(rootNode.left).thenReturn(null);
      when(rootNode.right).thenReturn(null);

      expect(depth_of_tree(rootNode), 1);
    });

    test('should return correct depth for balanced tree', () {
      final rootNode = MockNode();
      final leftNode = MockNode();
      final rightNode = MockNode();

      when(rootNode.left).thenReturn(leftNode);
      when(rootNode.right).thenReturn(rightNode);
      when(leftNode.left).thenReturn(null);
      when(leftNode.right).thenReturn(null);
      when(rightNode.left).thenReturn(null);
      when(rightNode.right).thenReturn(null);

      expect(depth_of_tree(rootNode), 2);
    });

    test('should return correct depth for left-skewed tree', () {
      final rootNode = MockNode();
      final leftNode = MockNode();
      final leftLeftNode = MockNode();

      when(rootNode.left).thenReturn(leftNode);
      when(rootNode.right).thenReturn(null);
      when(leftNode.left).thenReturn(leftLeftNode);
      when(leftNode.right).thenReturn(null);
      when(leftLeftNode.left).thenReturn(null);
      when(leftLeftNode.right).thenReturn(null);

      expect(depth_of_tree(rootNode), 3);
    });

    test('should return correct depth for right-skewed tree', () {
      final rootNode = MockNode();
      final rightNode = MockNode();
      final rightRightNode = MockNode();

      when(rootNode.left).thenReturn(null);
      when(rootNode.right).thenReturn(rightNode);
      when(rightNode.left).thenReturn(null);
      when(rightNode.right).thenReturn(rightRightNode);
      when(rightRightNode.left).thenReturn(null);
      when(rightRightNode.right).thenReturn(null);

      expect(depth_of_tree(rootNode), 3);
    });

    test('should return correct depth for complex tree', () {
      final rootNode = MockNode();
      final leftNode = MockNode();
      final rightNode = MockNode();
      final leftLeftNode = MockNode();
      final leftRightNode = MockNode();
      final rightLeftNode = MockNode();
      final rightRightNode = MockNode();

      when(rootNode.left).thenReturn(leftNode);
      when(rootNode.right).thenReturn(rightNode);
      when(leftNode.left).thenReturn(leftLeftNode);
      when(leftNode.right).thenReturn(leftRightNode);
      when(rightNode.left).thenReturn(rightLeftNode);
      when(rightNode.right).thenReturn(rightRightNode);
      when(leftLeftNode.left).thenReturn(null);
      when(leftLeftNode.right).thenReturn(null);
      when(leftRightNode.left).thenReturn(null);
      when(leftRightNode.right).thenReturn(null);
      when(rightLeftNode.left).thenReturn(null);
      when(rightLeftNode.right).thenReturn(null);
      when(rightRightNode.left).thenReturn(null);
      when(rightRightNode.right).thenReturn(null);

      expect(depth_of_tree(rootNode), 3);
    });
  });
}
