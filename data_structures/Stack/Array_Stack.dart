//Author: Shawn
//Email: stepfencurryxiao@gmail.com

class ArrayStack<T> {
  //stack
  List<T?> stack;
  //element of the stack
  int count;
  //size of stack
  int n;

  //Init the array stack
  ArrayStack(this.n)
      : stack = List<T?>.filled(n, null),
        count = 0;

  //Push a item to the stack
  void push(T item) {
    if (count == n) {
      print('The stack is full\n');
    }
    stack[count] = item;
    count++;
  }

  //Pop a item from the stack
  T? pop() {
    if (count == 0) {
      print('No data in the stack!\n');
    }
    T? popData = stack[count - 1];
    stack[count - 1] = null;
    count--;
    return popData;
  }

  void Display() {
    print('ArrayStack: $stack\n');
  }
}

void main() {
  ArrayStack<String> arrayStack = ArrayStack<String>(6);

  arrayStack.push('1');
  arrayStack.push('2');
  arrayStack.push('3');
  arrayStack.push('4');
  arrayStack.push('5');
  arrayStack.push('6');

  arrayStack.Display();

  String? popData;
  popData = arrayStack.pop();
  print('Pop $popData from stack\n');
  popData = arrayStack.pop();
  print('Pop $popData from stack\n');
  print('Now the stock:');
  arrayStack.Display();
}
