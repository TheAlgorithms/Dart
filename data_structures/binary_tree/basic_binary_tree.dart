//Author:Shawn
//Email:stepfencurryxiao@gmail.com

/*This is Class Node with constructor that contains
 * data variable to type data and left,right pointers
*/
class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data)
      : left = null,
        right = null;
}

/*In order traversal of the tree*/
void display(var tree) {
  if (tree == null) {
    return;
  }

  if (tree.left != null) {
    display(tree.left);
  }

  print(tree.data);

  if (tree.right != null) {
    display(tree.right);
  }

  return;
}

/*
 *This is the recursive function to find the depth of
 * binary tree.
*/
double depth_of_tree(var tree) {
  if (tree == null) {
    return 0;
  } else {
    var depthLTree = depth_of_tree(tree.left);
    var depthRTree = depth_of_tree(tree.right);

    if (depthLTree > depthRTree) {
      return (1 + depthLTree);
    } else {
      return (1 + depthRTree);
    }
  }
}

/*This function returns that is it full binary tree or not*/
bool is_full_binary_tree(var tree) {
  if (tree == null) {
    return true;
  }
  if (tree.left == null && tree.right == null) {
    return true;
  }
  if (tree.left != null && tree.right != null) {
    return (is_full_binary_tree(tree.left) && is_full_binary_tree(tree.right));
  } else {
    return false;
  }
}

//Main function for testing
void main() {
  var tree = Node(1);
  tree.left = Node(2);
  tree.right = Node(3);
  tree.left!.left = Node(4);
  tree.left!.right = Node(5);
  tree.left!.right!.left = Node(6);
  tree.right!.left = Node(7);
  tree.right!.left!.left = Node(8);
  tree.right!.left!.left!.right = Node(9);

  print(is_full_binary_tree(tree));
  print(depth_of_tree(tree));
  print('Tree is:\n');
  display(tree);
}
