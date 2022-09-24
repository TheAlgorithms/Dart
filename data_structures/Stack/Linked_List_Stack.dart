//Author: Shawn
//Email: stepfencurryxiao@gmail.com

class Node<T> {
  //the data of the Node
  T data;
  Node? next;

  Node(this.data) : next = null;
}

class LinkedListStack<T> {
  //Top of stack
  Node<T?>? head;

  //Size of stack
  int? size;

  LinkedListStack() {
    head = null;
    size = 0;
  }

  //Add element at top of the stack

  void push(T element) {
    Node<T> newNode = Node<T>(element);
    newNode.next = head;
    head = newNode;
    size = size! + 1;
  }

  //Pop element from top at the stack

  T? pop() {
    T? returnData;
    if (size == 0) {
      print('The stack is empty!!!');
    } else {
      Node<T?> destroy = head!;
      head = head!.next as Node<T?>?;
      returnData = destroy.data;
      size = size! - 1;
    }
    return returnData;
  }

  bool isEmpty() {
    return size == 0;
  }

  int? getSize() {
    return size;
  }
}

int main() {
  LinkedListStack<String> Stack = LinkedListStack<String>();
  String? returnData;
  print('Push 2 5 9 7 to the stack\n');
  Stack.push('2');
  Stack.push('5');
  Stack.push('9');
  Stack.push('7');
  print('Successful push!\n');
  returnData = Stack.pop();
  print('Pop a data: $returnData\n');
  returnData = Stack.pop();
  print('Pop a data: $returnData\n');
  returnData = Stack.pop();
  print('Pop a data: $returnData\n');
  return 0;
}
