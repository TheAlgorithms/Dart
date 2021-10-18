List<int> countSort(List<int> arr) {
  int min = arr[0], max = arr[0], i;
  List<int> outputArr = [], countArr = [];
  for (int i in arr) {
    if (i > max) max = i;
    if (i < min) min = i;
  }

  int range = max - min + 1;

  // INITIALISING countArr with 0's
  for (i = 0; i < range; i++) {
    countArr.add(0);
  }
  for (i = 0; i < arr.length; i++) {
    outputArr.add(0);
  }

  for (i in arr) {
    countArr[i - min] += 1;
  }

  // PREFIX SUM OF countArr
  for (i = 1; i < countArr.length; i++) {
    countArr[i] += countArr[i - 1];
  }

  // PUTING VALUES IN SORTED ARRAY
  for (i in arr) {
    int index = countArr[i - min];
    outputArr[index - 1] = i;
    countArr[i - min] -= 1;
  }

  // COPYING VALUES OF SORTED ARRAY INTO ORIGINAL ARRAY
  for (i = 0; i < outputArr.length; i++) {
    arr[i] = outputArr[i];
  }

  return arr;
}

int main() {
  print(countSort([-10, -4, 1, 5, 2, -2]));
  return 0;
}
