//Author:Shawn
//Email:stepfencurryxiao@gmail.com

/*
 *         1
 *       /   \
 *      2     3
 *     / \   / \
 *     5 4   6  7
 *    / \
 *    8 9
 *  
 * Array:[1,2,3,5,4,6,7,8,9]
 * 
 * rightchild : 2n + 2
 * leftcgild : 2n + 1
*/

List upAdjust(List arr, int length) {
  //Mark inserted nodes
  var child = length - 1;
  //Father nodes
  int parent = (child - 1) ~/ 2;
  //Save the inserted node temporarily
  int temp = arr[child];

  while (child > 0 && temp < arr[parent]) {
    //When temp finds the correct location, we will assign the value of temp to this node
    arr[child] = arr[parent];
    child = parent;
    parent = (child - 1) ~/ 2;
  }
  arr[child] = temp;
  return arr;
}

/* *
** Sink operation, delete operation is equivalent to
** after an element is assigned to the root element, the sink  operation is performed on the root element
* @param arr
*@ param parent subscript of element to sink
*@ param length array length
*/
List downAdjust(List arr, int parent, int length) {
  //Save elements to sink
  int temp = arr[parent];
  //Locate left child node location
  int child = 2 * parent + 1;
  //Begin to sink
  while (child < length) {
    //If the right child node is smaller than the left child, locate the right child
    if (child + 1 < length && arr[child] > arr[child + 1]) {
      child++;
    }
    //Sink ends if parent is smaller or equal to child
    if (temp <= arr[child]) break;

    arr[parent] = arr[child];
    parent = child;
    child = 2 * parent + 1;
  }
  arr[parent] = temp;
  return arr;
}

List buildHead(List arr, int length) {
  //Sink from the last non leaf node
  for (int i = (length - 2) ~/ 2; i >= 0; i--) {
    arr = downAdjust(arr, i, length);
  }
  return arr;
}

void main() {
  List arr = [1, 3, 0, 5, 4, 6, 7, 8, 9];
  List BinaryHeap = buildHead(arr, arr.length);
  print(BinaryHeap);
}
