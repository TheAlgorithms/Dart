void oddEvenSort(List<int> arr) {
  bool sorted = false;
  int n = arr.length;

  while (!sorted) {
    sorted = true;

    // Perform the odd phase (compare and swap odd-indexed elements)
    for (int i = 1; i < n - 1; i += 2) {
      if (arr[i] > arr[i + 1]) {
        int temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        sorted = false;
      }
    }

    // Perform the even phase (compare and swap even-indexed elements)
    for (int i = 0; i < n - 1; i += 2) {
      if (arr[i] > arr[i + 1]) {
        int temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        sorted = false;
      }
    }
  }
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  print("Original List: $arr");
  
  oddEvenSort(arr);

  print("Sorted List: $arr");
}
