import 'package:test/test.dart';

void pigeonholeSort(List arr) {
  //The length of the list
  int n = arr.length;

  //checking the size
  if (n <= 0) {
    return;
  }

  //Find minimum and maximum values in arr
  int min = arr[0];
  int max = arr[0];

  for (int i = 1; i < n; i++) {
    if (arr[i] < min) min = arr[i];
    if (arr[i] > max) max = arr[i];
  }

  int range = max - min;
  range++;

  List<int> phole = List.generate(range, (i) => 0);

  //Populate the pigeonholes.
  for (int i = 0; i < n; i++) {
    phole[arr[i] - min];
    phole[arr[i] - min] = phole[arr[i] - min] + 1;
  }

  //Put the elements back into the array in order
  int index = 0;

  for (int j = 0; j < range; j++) while (phole[j]-- > 0) arr[index++] = j + min;
}

void main() {
  test("Sort empty list returns empty list", () {
    List list = [];
    pigeonholeSort(list);
    expect(list, isEmpty);
  });

  test("Already sorted list remain sorted", () {
    List list = [1, 2, 3, 4, 5];
    pigeonholeSort(list);
    expect(list, equals([1, 2, 3, 4, 5]));
  });

  test("Sort", () {
    List list = [87, 48, 5, 7, 135, 85];
    pigeonholeSort(list);
    expect(list, equals([5, 7, 48, 85, 87, 135]));
  });

  test("Sorted list size doesnt change", () {
    List list = [1, 1, 4, 1, -12, -12, 77];
    pigeonholeSort(list);
    expect(list.length, equals(7));
    expect(list, [-12, -12, 1, 1, 1, 4, 77]);
  });
}
