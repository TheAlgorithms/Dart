void cycleSort(List<int> arr) {
  int n = arr.length;

  for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
    int item = arr[cycleStart];
    int pos = cycleStart;

    // Find the position where the item should be placed
    for (int i = cycleStart + 1; i < n; i++) {
      if (arr[i] < item) {
        pos++;
      }
    }

    // If the item is already at the correct position, continue to the next cycle
    if (pos == cycleStart) {
      continue;
    }

    // Skip duplicate elements
    while (item == arr[pos]) {
      pos++;
    }

    // Swap the item with the element at its correct position
    if (pos != cycleStart) {
      int temp = item;
      item = arr[pos];
      arr[pos] = temp;
    }

    // Perform additional cycles if needed to place other elements in their correct positions
    while (pos != cycleStart) {
      pos = cycleStart;
      for (int i = cycleStart + 1; i < n; i++) {
        if (arr[i] < item) {
          pos++;
        }
      }

      // Skip duplicate elements
      while (item == arr[pos]) {
        pos++;
      }

      // Swap the item with the element at its correct position
      if (item != arr[pos]) {
        int temp = item;
        item = arr[pos];
        arr[pos] = temp;
      }
    }
  }
}

void main() {
  List<int> data = [5, 1, 3, 4, 2];
  cycleSort(data);
  print("Sorted Data: $data");
}
