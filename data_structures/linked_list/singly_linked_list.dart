//https://en.wikipedia.org/wiki/Linked_list

//structure of Node
class Node<T> {
  T element;
  Node link;

  Node(this.element);
}


//linked list creation
class LinkedList<T> {
  Node<T> front;
  LinkedList();
  int _size = 0;

  int size(){
    return _size;
  }

  bool isEmpty() {
    return _size == 0;
  }

  void append(T element) {
    var node = new Node(element);
    var current = front;
    if (front == null) {
      front = node;
    } else {
      current = front;
      while (current.link != null) {
        current = current.link;
      }
      current.link = node;
    }
    _size++;
  }
//remove at a particular pos of the list

  T removeAt(int pos) {
    if (pos < _size) {
      var index = 0;
      var previous = front, current = front;
      if (pos == 0) {
        front = current.link;
      } else {
        while (index++ < pos) {
          previous = current;
          current = current.link;
        }
        previous.link = current.link;
      }
      _size--;
      return current.element;
    }
    return null;
  }
  //insert at a particular pos

  bool insert(int pos, T element) {
    if (pos >= 0 && pos < _size) {
      var node = new Node(element);
      var index = 0;
      var previous = front, current = front;
      if (pos == 0) {
        node.link = current;
        front = node;
      } else {
        while (index++ < pos) {
          previous = current;
          current = current.link;
        }
        node.link = current;
        previous.link = node;
      }
      _size++;
      return true;
    }
    return false;
  }
//pos where a particular element is present
  int indexOf(T element) {
    var index = 0;
    var current = front;
    while (current != null) {
      if (current.element == element) {
        return index;
      }
      current = current.link;
      index++;
    }
    return -1;
  }
//remove a particular element
  T remove(T element) {
    var index = indexOf(element);
    if(index != -1)
      return removeAt(index);
    return null;
  }
//printing the complete linked list
  void printList()
  {
    var current = front;
    while(current != null)
    {
      print(current.element);
      current = current.link;
    }
  }
}
//main function
int main()
{
  LinkedList<int> linkedList = new LinkedList<int>();
  linkedlist.append(1);
  linkedlist.append(2);
  linkedlist.printList();
  return 0;
}