import 'package:test/test.dart';

List<int> countSort(List<int> arr) {
  // In case the list is empty, return an empty list
  if (arr.length == 0) return [];

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
  test("Sorting of empty list returns empty list", () {
    expect(countSort([]), equals([]));
  });
  test("Sorting one element list return same list", () {
    expect(countSort([1]), equals([1]));
  });
  test("Sorting two times doesnt change input", () {
    List<int> lst = [5, 7, 1, 10, 54, -1];
    expect(countSort(lst), equals(countSort(countSort(lst))));
  });
  test("Sorting already sorted list returns same list", () {
    List<int> lst = [1, 2, 3, 4, 10];
    expect(countSort(lst), equals(lst));
  });
  test("count sort", () {
    expect(countSort([34, -2, 122, 24435, 23, 434, 232, 1323]),
        equals([-2, 23, 34, 122, 232, 434, 1323, 24435]));
  });

  print(countSort([-10, -4, 1, 5, 2, -2]));

  return 0;
}
