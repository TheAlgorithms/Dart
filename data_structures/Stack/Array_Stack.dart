//Author: Shawn
//Email: stepfencurryxiao@gmail.com

class ArrayStack{
  //stack
  List stack;
  //element of the stack
  int count;
  //size of stack
  int n;
  
  //Init the array stack
  ArrayStack(var n){
    this.n = n;
    this.stack = new List(n);
    this.count = 0;
  }
  
  //Push a item to the stack
  void push(String item){
    if(count == n){
      print("The stack is full\n");
    }
    stack[count] = item;
    count++;
  }
  
  //Pop a item from the stack
  String pop(){
    if(count == 0){
      print("No data in the stack!\n");
    }
    String pop_data = stack[count - 1];
    count--;
    return pop_data;
  }
  
  void Display(){
    print("ArrayStack: $stack\n");
  }
}

void main(){
  ArrayStack array_stack = new ArrayStack(6);
  
  array_stack.push('1');
  array_stack.push("2");
  array_stack.push('3');
  array_stack.push("4");
  array_stack.push('5');
  array_stack.push("6");
  
  array_stack.Display();
  
  var pop_data;
  pop_data = array_stack.pop();
  print("Pop $pop_data from stack\n");
  pop_data = array_stack.pop();
  print("Pop $pop_data from stack\n");
}