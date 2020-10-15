// function for combsort
void combSort(List list) {
  int gpVal = list.length;
  double shrink = 1.3;
  bool sortedBool = false;

  while (!sortedBool) {
    gpVal = (gpVal / shrink).floor();
    if (gpVal > 1) {
      sortedBool = false;
    } else {
      gpVal = 1;
      sortedBool = true;
    }

    int i = 0;
    while (i + gpVal < list.length) {
      if (list[i] > list[i + gpVal]) {
        swap(list, i, gpVal);
        sortedBool = false;
      }
      i++;
    }
  }
}

// function to swap the values
void swap(List list, int i, int gpVal) {
  int temp = list[i];
  list[i] = list[i + gpVal];
  list[i + gpVal] = temp;
}

void main() {
  //Get the dummy array
  List arr = [1, 451, 562, 2, 99, 78, 5];
  // for printing the array before sorting
  print("Before sorting the array: $arr\n");
  // applying combSort function
  combSort(arr);
  // printing the sortedBool value
  print("After sorting the array: $arr");
}
