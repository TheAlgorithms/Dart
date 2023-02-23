import 'dart:math' show Random;

void merge(List list, int lIndex, int mIndex, int rIndex) {
  int lSize = mIndex - lIndex + 1;
  int rSize = rIndex - mIndex;

  List lList = new List(lSize);
  List rList = new List(rSize);

  for (int i = 0; i < lSize; i++) lList[i] = list[lIndex + i];
  for (int j = 0; j < rSize; j++) rList[j] = list[mIndex + j + 1];

  int i = 0, j = 0;
  int k = lIndex;

  while (i < lSize && j < rSize) {
    if (lList[i] <= rList[j]) {
      list[k] = lList[i];
      i++;
    } else {
      list[k] = rList[j];
      j++;
    }
    k++;
  }

  while (i < lSize) {
    list[k] = lList[i];
    i++;
    k++;
  }

  while (j < rSize) {
    list[k] = rList[j];
    j++;
    k++;
  }
}

void mergeSort(List list, int lIndex, int rIndex) {
  if (lIndex < rIndex) {
    int mIndex = (rIndex + lIndex) ~/ 2; // finds the middle index

    mergeSort(list, lIndex, mIndex); // sorts the first half of the list
    mergeSort(list, mIndex + 1, rIndex); // sorts the second half of the list

    merge(list, lIndex, mIndex, rIndex);
  }
}

void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('--------------------------------------');
  print('After sorting:');
  mergeSort(list, 0, list.length - 1);
  print(list);
}
