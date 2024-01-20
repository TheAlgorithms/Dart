void printLeaders(List<int> arr, int size) {
  for (int i = 0; i < size; i++) {
    int j;
    for (j = i + 1; j < size; j++) {
      if (arr[i] < arr[j]) break;
    }
    if (j == size) // the loop didn't break
    {
      print(arr[i]); // print the leaders in array
      print(" ");
    }
  }
}

/* Driver program to test above function */
void main() {
  List<int> arr = [22, 37, 4, 1, 18, 10];
  int n = arr.length;
  printLeaders(arr, n);
}
