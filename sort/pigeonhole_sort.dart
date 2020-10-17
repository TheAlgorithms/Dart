void pigeonholeSort(List arr) {
  //The length of the list
  int n = arr.length;

  //Find minimum and maximum values in arr
  int min = arr[0];
  int max = arr[0];

  for (int i = 1; i < n; i++) {
    if (arr[i] < min) min = arr[i];
    if (arr[i] > max) max = arr[i];
  }

  int range = max - min;
  range++;

  List phole = new List(range);
  for (int i = 0; i < range; i++) {
    phole[i] = 0;
  }

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
  List list = [87, 48, 5, 7, 135, 85];
  print('Before sorting:');
  print(list);
  print('--------------------------------------');
  print('After sorting:');
  pigeonholeSort(list);
  print(list);
}
