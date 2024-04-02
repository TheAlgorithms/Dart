//Author: Shawn
//Email: stepfencurryxiao@gmail.com

class Node<T> {
  //the data of the Node
  T? data;
  Node<T>? next;

  Node(T? data) {
    this.data = data;
    this.next = null;
  }
}

class LinkedListStack<T> {
  //Top of stack
  Node<T>? head;

  //Size of stack
  int size = 0;

  LinkedListStack() {
    this.head = null;
    this.size = 0;
  }

  //Add element at top of the stack

  void push(T element) {
    Node<T> newNode = new Node<T>(element);
    newNode.next = this.head;
    this.head = newNode;
    this.size++;
  }

  //Pop element from top at the stack

  T? pop() {
    T? returnData = null;
    if (size == 0) {
      print("The stack is empty!!!");
    } else {
      Node<T>? destroy = this.head;
      this.head = this.head?.next;
      returnData = destroy?.data;
      this.size--;
    }
    return returnData;
  }

  bool isEmpty() {
    return this.size == 0;
  }

  int getSize() {
    return this.size;
  }
}

int main() {
  LinkedListStack<String> Stack = new LinkedListStack<String>();
  var returnData;
  print("Push 2 5 9 7 to the stack\n");
  Stack.push("2");
  Stack.push("5");
  Stack.push("9");
  Stack.push("7");
  print("Successful push!\n");
  returnData = Stack.pop();
  print("Pop a data: $returnData\n");
  returnData = Stack.pop();
  print("Pop a data: $returnData\n");
  returnData = Stack.pop();
  print("Pop a data: $returnData\n");
  return 0;
}
