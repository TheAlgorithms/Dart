import 'package:test/test.dart';

void merge(List list, int lIndex, int mIndex, int rIndex) {
  int lSize = mIndex - lIndex + 1;
  int rSize = rIndex - mIndex;

  List lList = new List.filled(lSize, () => 0);
  List rList = new List.filled(rSize, () => 0);

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

List<int> mergeSort(List<int> list, int lIndex, int rIndex) {
  if (lIndex < rIndex) {
    int mIndex = (rIndex + lIndex) ~/ 2; // finds the middle index

    mergeSort(list, lIndex, mIndex); // sorts the first half of the list
    mergeSort(list, mIndex + 1, rIndex); // sorts the second half of the list

    merge(list, lIndex, mIndex, rIndex);
  }
  return list;
}

void main() {
  List<int> list = [5, 4, 3, 2, 1];
  test('test case 1',
      () => expect(mergeSort(list, 0, list.length - 1), [1, 2, 3, 4, 5]));

  List<int> list1 = [];
  test('test case 2', () => expect(mergeSort(list1, 0, list1.length - 1), []));

  List<int> list2 = [1, 1, 1, 1, 1];
  test('test case 3',
      () => expect(mergeSort(list2, 0, list2.length - 1), [1, 1, 1, 1, 1]));

  List<int> list3 = [-1, -11, -1221, -123121, -1111111];
  test(
      'test case 4',
      () => expect(mergeSort(list3, 0, list3.length - 1),
          [-1111111, -123121, -1221, -11, -1]));

  List<int> list4 = [11, 1, 1200, -1, 5];
  test(
      'test case 1',
      () =>
          expect(mergeSort(list4, 0, list4.length - 1), [-1, 1, 5, 11, 1200]));
}
