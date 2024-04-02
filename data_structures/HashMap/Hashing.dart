//Author:Shawn
//Email:stepfencurryxiao@gmail.com

class Node {
  int? data;
  Node? next;

  Node(int data) {
    this.data = data;
    this.next = null;
  }
}

class LinkedList {
  Node? head;
  int size;

  LinkedList({this.size = 0}) {
    head = null;
  }

  void insert(int data) {
    Node newnode = new Node(data);

    size++;

    if (head == null) {
      head = newnode;
    } else {
      newnode.next = head;
      head = newnode;
    }
  }

  void delete(int data) {
    if (size == 0) {
      print("underFlow!");
      return;
    } else {
      Node? curr = head;
      if (curr?.data == data) {
        head = curr?.next;
        size--;
        return;
      } else {
        while (curr?.next?.next != null) {
          if (curr?.next?.data == data) {
            curr?.next = curr.next?.next;
            return;
          }
        }
        print("Key not found");
      }
    }
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data.toString());
      temp = temp.next;
    }
    print("\n");
  }
}

class HashMap {
  int hsize;
  List<LinkedList> buckets;

  HashMap({this.hsize = 0, this.buckets = const []}) {
    buckets = new List.generate(hsize, (a) => LinkedList());
    for (int i = 0; i < hsize; i++) {
      buckets[i] = new LinkedList();
    }
    this.hsize = hsize;
  }

  int hashing(int key) {
    int hash = key % hsize;
    if (hash < 0) {
      hash += hsize;
    }
    return hash;
  }

  void insertHash(int key) {
    int hash = hashing(key);
    buckets[hash].insert(key);
  }

  void deleteHash(int key) {
    int hash = hashing(key);
    buckets[hash].delete(key);
  }

  void displayHashtable() {
    for (int i = 0; i < hsize; i++) {
      print("Bucket $i:");
      buckets[i].display();
    }
  }
}

void main() {
  HashMap h = new HashMap(hsize: 7);

  print("Add key 5");
  h.insertHash(5);

  print("Add key 28");
  h.insertHash(28);

  print("Add key 1");
  h.insertHash(1);

  print("Delete Key 28");
  h.deleteHash(28);

  print("Print Table:\n");
  h.displayHashtable();

  print("Delete Key 1");
  h.deleteHash(1);

  print("Print Table:\n");
  h.displayHashtable();
}
