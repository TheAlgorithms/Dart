void bitonicSort(List<int> arr, bool ascending) {
  // Ensure that the input array size is a power of 2
  if ((arr.length & (arr.length - 1)) != 0) {
    throw ArgumentError("Input array size must be a power of 2.");
  }

  // Recursive function to perform bitonic merge
  void bitonicMerge(List<int> arr, int low, int count, bool ascending) {
    if (count > 1) {
      int k = count ~/ 2;
      for (int i = low; i < low + k; i++) {
        if ((arr[i] > arr[i + k]) == ascending) {
          // Swap elements to maintain bitonicity
          int temp = arr[i];
          arr[i] = arr[i + k];
          arr[i + k] = temp;
        }
      }
      bitonicMerge(arr, low, k, ascending);
      bitonicMerge(arr, low + k, k, ascending);
    }
  }

  // Main bitonic sort function
  void bitonicSortRecursive(List<int> arr, int low, int count, bool ascending) {
    if (count > 1) {
      int k = count ~/ 2;

      // Bitonic split phase
      bitonicSortRecursive(arr, low, k, !ascending);
      bitonicSortRecursive(arr, low + k, k, ascending);

      // Bitonic merge phase
      bitonicMerge(arr, low, count, ascending);
    }
  }

  // Start the bitonic sort process
  bitonicSortRecursive(arr, 0, arr.length, ascending);
}

void main() {
  List<int> data = [3, 7, 4, 8, 6, 2, 1, 5];
  bool ascending = true; // Sort in ascending order
  bitonicSort(data, ascending);
  print("Sorted Data (Ascending): $data");
}
