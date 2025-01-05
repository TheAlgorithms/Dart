int binary_search(List num, int l, int r, int search) {
  if (r >= l) {
    int middle = (l + (r - l) / 2).toInt();

    //If the element is present at middle
    if (num[middle] == search) {
      return middle;
    }

    //If the element is smaller than middle
    if (num[middle] > search) {
      return binary_search(num, l, middle - 1, search);
    }

    return binary_search(num, middle + 1, r, search);
  }
  return -1;
}

void main() {
  List list = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  int search = 55;
  int n = list.length;
  int index = binary_search(list, 0, n - 1, search);
  print('list:');
  print(list);
  if (index != -1) {
    print('$search found at positions: $index');
  } else {
    print('$search Not found');
  }
}
