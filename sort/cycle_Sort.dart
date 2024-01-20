void cycleSort(List<int> arr) {
  int n = arr.length;

  for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
    int item = arr[cycleStart];
    int pos = cycleStart;

    // Find the position to place the current item
    for (int i = cycleStart + 1; i < n; i++) {
      if (arr[i] < item) {
        pos++;
      }
    }

    // Skip if the item is already in its correct position
    if (pos == cycleStart) {
      continue;
    }

    // Place the item in its correct position
    while (item == arr[pos]) {
      pos++;
    }
    int temp = arr[pos];
    arr[pos] = item;
    item = temp;

    // Rotate the rest of the cycle
    while (pos != cycleStart) {
      pos = cycleStart;
      for (int i = cycleStart + 1; i < n; i++) {
        if (arr[i] < item) {
          pos++;
        }
      }

      while (item == arr[pos]) {
        pos++;
      }
      temp = arr[pos];
      arr[pos] = item;
      item = temp;
    }
  }
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  print("Original List: $arr");
  
  cycleSort(arr);

  print("Sorted List: $arr");
}
