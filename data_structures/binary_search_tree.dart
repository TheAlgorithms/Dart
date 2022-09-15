/// [value] is the data stored in the node.
/// [left] is the left child
/// [right] is the right child
class BinarySearchTree {
  int value;
  BinarySearchTree? left;
  BinarySearchTree? right;

  BinarySearchTree(this.value, {this.left, this.right});

  // Time Complexity-> Average => O(log(N)), Worst case O(N)
  // Space Complexity->
  // Recursive -> Average => O(log(N)), Worst O(N)
  // Iterative => O(1)
  // where N is the total number of nodes in BST.
  void insertNode(int newNodeValue) {
    BinarySearchTree? currentNode = this;

    while (currentNode != null) {
      // if the new value to be inserted is less than the value of the current node
      // then we need to insert this value into the left sub tree
      // if left sub tree is null. we can create a new bst node with the new value and
      // update the left child of the node.
      /// llly for the case of right sub treee.
      if (newNodeValue < currentNode.value) {
        if (currentNode.left == null) {
          currentNode.left = BinarySearchTree(newNodeValue);
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right == null) {
          currentNode.right = BinarySearchTree(newNodeValue);
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  // returns the smallest value in the subtree
  int getMinValueInSubTree() {
    BinarySearchTree currentNode = this;
    while (currentNode.left != null) {
      currentNode = currentNode.left!;
    }
    return currentNode.value;
  }

  void deleteNode(int nodeValueToBeDeleted, {BinarySearchTree? parentNode}) {
    BinarySearchTree? currentNode = this;
    while (currentNode != null) {
      if (nodeValueToBeDeleted < currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (nodeValueToBeDeleted > currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        // Case: currentNode.value == nodeValueToBeDeleted

        // When the node has both the child nodes. we need to find the smallest value in
        // the right sub tree and replace the current node with it and delete the smallest node 
        // in the right sub tree.
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.value = currentNode.right!.getMinValueInSubTree();
          currentNode.right!.deleteNode(currentNode.value, parentNode: currentNode);
        } else if (parentNode == null) {
          // Root node with one child.
          if (currentNode.left != null) {
            currentNode.value = currentNode.left!.value;
            currentNode.right = currentNode.left!.right;
            currentNode.left = currentNode.left!.left;
          } else if (currentNode.right != null) {
            currentNode.value = currentNode.right!.value;
            currentNode.left = currentNode.right!.left;
            currentNode.right = currentNode.right!.right;
          }
        } else if (parentNode.left == currentNode) {
          parentNode.left = currentNode.left ?? currentNode.right;
        } else if (parentNode.right == currentNode) {
          parentNode.right = currentNode.left ?? currentNode.right;
        }
        break;
      }
    }
  }

  bool contains(int searchValue) {
    BinarySearchTree? currentNode = this;
    while (currentNode != null) {
      if (currentNode.value == searchValue) {
        return true;
      } else if (searchValue < currentNode.value) {
        currentNode = currentNode.left;
      } else {
        currentNode = currentNode.right;
      }
    }
    return false;
  }

  bool isLeafNode(BinarySearchTree node) {
    return node.left == null && node.right == null;
  }
}
