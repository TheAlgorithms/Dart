int majorityElement(List<int> arr, int n) {
  arr.sort();

  var count = 1, max_ele = -1, temp = arr[0], ele = 0, f = 0;

  for (int i = 1; i < n; i++) {
    if (temp == arr[i]) {
      count++;
    } else {
      count = 1;
      temp = arr[i];
    }
    if (max_ele < count) {
      max_ele = count;
      ele = arr[i];

      if (max_ele > (n / 2)) {
        f = 1;
        break;
      }
    }
  }
  return (f == 1 ? ele : -1);
}

// Driver code
void main() {
  List<int> a1 = [1, 2, 2, 2, 2, 5, 1];
  print(majorityElement(a1, a1.length));
  List<int> a2 = [3, 3, 22, 21, 21, 5, 21];
  print(majorityElement(a2, a2.length));
  List<int> a3 = [30, 30, 40, 30, 40, 30, 40];
  print(majorityElement(a3, a3.length));
  List<int> a4 = [100, 4000, 220, 220, 220, 100, 4000];
  print(majorityElement(a4, a4.length));
}
